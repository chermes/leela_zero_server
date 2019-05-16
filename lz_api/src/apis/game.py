#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
game/ entry point.
"""
import uuid
import datetime
import re

import requests
from flask_restplus import Resource, fields, Namespace
from sgfmill import sgf

from . import db_conn

regex_ogs_url = re.compile(r'.*http[s]*://online-go.com/game/([0-9]+).*$')

api = Namespace('game', description='Game information and changes.')

status_model = api.model('Status', model={
    'is_finished': fields.Boolean(required=True,
                                  description='Is the analyze finished?',
                                  example=False),
    'is_running': fields.Boolean(required=True,
                                 description='Is the analyze currently running?',
                                 example=True),
    'progress': fields.Float(required=True,
                             description='Progress (percent) of the SGF analysis.',
                             example=55.0),
})

win_rate_model = api.model('WinRate', model={
    'move': fields.Integer(required=True,
                           description='Move number.',
                           example=42),
    'win_rate_black': fields.Float(required=True,
                                   description='Estimated win rate / probability of the black player [factor].',
                                   min=0.0, max=1.0,
                                   example=0.5),
})

game_id_model = api.model('GameID', model={
    'game_id': fields.String(required=True,
                             description='Unique game identifier',
                             example=uuid.uuid4().hex),
})

sgf_string_model = api.model('SgfString', model={
    'sgf_string': fields.String(required=False,
                                description='SGF content.',
                                example='(;GM[1]FF[4]AP[qGo:2.1.0]ST[1] SZ[19]HA[0]KM[5.5]PW[White]PB[Black] ;B[pd];W[dp];B[qp];W[dd];B[nq])'),
})

ogs_game_id_model = api.model('OnlineGoGameId', model={
    'ogs_game_id': fields.String(required=True,
                                 description='OGS game number.',
                                 example='17049439'),
})

ogs_game_url_model = api.model('OnlineGoGameUrl', model={
    'ogs_game_url': fields.Url(required=True,
                               description='OGS game link. The OGS game ID will be parsed from it.',
                               example='https://online-go.com/game/17049439'),
})

game_model = api.model('Game', model={
    'game_id': game_id_model['game_id'],
    'name': fields.String(required=True,
                          description='Name of the game, file, .etc',
                          example='The best game ever'),
    'sgf_orig': sgf_string_model['sgf_string'],
    'creation_date': fields.DateTime(required=True,
                                     description='Creation / upload date.',
                                     example='2018-11-01T15:40:51.422167'),
    'status': fields.Nested(status_model,
                            description='Go analyze status.',
                            required=True),
    'sgf_analyzed': sgf_string_model['sgf_string'],
    'win_rate': fields.List(fields.Nested(win_rate_model),
                            required=False,
                            description='Estimated win rate (black) for each move.'),
})


def _add_sgf_game_to_db(sgf_raw, is_bytes, name):
    """
    Append a raw SGF to the database (incl. some validation checks).

    Parameters
    ----------
    sgf_raw : bytes or str
        Raw SGF game.
    is_bytes : boolean
        Is the raw SGF in bytes?
    name : str
        Title of the game.

    Returns
    -------
    game_id : str
        Generated game ID.
    status_code : int
        200: success.
        400: invalid SGF.
    """
    game_id = uuid.uuid4().hex

    # check sgf input
    try:
        if is_bytes:
            sgf_game = sgf.Sgf_game.from_bytes(sgf_raw)
        else:
            sgf_game = sgf.Sgf_game.from_string(sgf_raw)
    except ValueError:
        return 'No valid SGF format.', 400

    if sgf_game.get_size() != 19:
        return 'Board size must be 19x19, not %dx%d' % (sgf_game.get_size(), sgf_game.get_size()), 400

    game = {
        '_id': game_id,
        'name': name,
        'sgf_orig': sgf_game.serialise().decode('utf-8'),
        'creation_date': datetime.datetime.now(),
        'status': {
            'is_finished': False,
            'is_running': False,
            'progress': 0.,
        },
        'sgf_analyzed': None,
        'win_rate': None,
    }

    # insert game into the db
    _, coll = db_conn.get_database_connection()
    coll.insert_one(game)

    return game_id, 200


@api.route('/is_alive')
class IsAlive(Resource):
    def post(self):
        """
        Test to check if this server is already running and responding.
        """
        return 'OK', 200


@api.route('/list/all')
class ListAll(Resource):
    @api.marshal_list_with(game_model)
    def post(self):
        """
        Returns all available games in the database sorted by creation date.
        This excludes the game and the analysis itself.
        """
        _, coll = db_conn.get_database_connection()

        games = list(coll.find({}, sort=[('creation_date', 1)],
                               projection={
                                   'name': 1,
                                   'creation_date': 1,
                                   'status': 1,
                               }))

        for game in games:
            game['game_id'] = game['_id']

        return games, 200


@api.route('/info')
class Info(Resource):
    @api.expect(game_id_model)
    @api.marshal_with(game_model)
    @api.response(404, 'Game not found in the DB.')
    def post(self):
        """
        Returns the full game model by the given id.
        """
        _, coll = db_conn.get_database_connection()

        game = coll.find_one({'_id': api.payload['game_id']})
        if game is None:
            return 'Game not found', 404

        game['game_id'] = game['_id']

        return game, 200


@api.route('/list/needs_analysis')
class ListNeedsAnalysis(Resource):
    @api.marshal_list_with(game_model)
    def post(self):
        """
        Returns games which still need an analysis (FIFO).
        """
        _, coll = db_conn.get_database_connection()

        games = coll.aggregate([
            {'$match': {'status.is_finished': False,
                        'status.is_running': False}},
            {'$sort': {'creation_date': 1}}
        ])
        games = list(games)

        for game in games:
            game['game_id'] = game['_id']

        return games, 200


@api.route('/reserve_for_analysis')
class ReserveAnalysis(Resource):
    @api.marshal_with(game_model)
    @api.response(204, 'No available game could be found.')
    def post(self):
        """
        Returns and reserves the next game which needs an analysis (FIFO).
        """
        _, coll = db_conn.get_database_connection()

        game = coll.find_one_and_update(
            {'status.is_finished': False, 'status.is_running': False},
            {'$set': {'status': {'is_finished': False,
                                 'is_running': True,
                                 'progress': 0.}}},
            sort=[('creation_date', 1)])

        if game is None:
            return 'No game found.', 204

        game['game_id'] = game['_id']
        # also reset status of the found game (!= database game)
        game['status']['is_finished'] = False
        game['status']['is_running'] = True
        game['status']['progress'] = 0.

        return game, 200


@api.route('/update')
class Update(Resource):
    @api.expect(game_model)
    @api.response(404, "Game could not be updated (there is no matching one in the DB).")
    def post(self):
        """
        Updates the database by the given game.
        """
        _, coll = db_conn.get_database_connection()

        game = api.payload
        game['_id'] = game['game_id']
        del game['game_id']
        game['creation_date'] = datetime.datetime.strptime(game['creation_date'], "%Y-%m-%dT%H:%M:%S.%f")

        ur = coll.update_one({'_id': game['_id']}, {'$set': game})

        if ur.modified_count < 1:
            game_id = game['_id']
            return f"Game {game_id} could not be found in the DB.", 404

        return 'OK', 200


@api.route('/upload/sgf/string')
class UploadSgfString(Resource):
    @api.expect(sgf_string_model)
    @api.marshal_with(game_id_model)
    @api.response(400, 'No valid SGF format.')
    def post(self):
        """
        Upload a SGF by raw string.
        """
        game_id, return_code = _add_sgf_game_to_db(api.payload['sgf_string'], False, 'Raw SGF upload')

        return {'game_id': game_id}, return_code


@api.route('/upload/ogs/id')
class UploadOgsId(Resource):
    @api.expect(ogs_game_id_model)
    @api.marshal_with(game_id_model)
    @api.response(400, 'No valid OGS Id.')
    def post(self):
        """
        Upload a SGF by online-go (OGS) game number.
        """
        # fetch SGF via the OGS API
        r = requests.get('https://online-go.com/api/v1/games/%s/sgf' % api.payload['ogs_game_id'])
        if r.status_code != 200:
            return 'Unable to load the OGS game.', 400
        raw_sgf_bytes = r.content

        game_id, return_code = _add_sgf_game_to_db(raw_sgf_bytes, True, 'OGS Game %s' % api.payload['ogs_game_id'])

        return {'game_id': game_id}, return_code


@api.route('/upload/ogs/url')
class UploadOgsUrl(Resource):
    @api.expect(ogs_game_url_model)
    @api.marshal_with(game_id_model)
    @api.response(400, 'No valid OGS link.')
    def post(self):
        """
        Upload a SGF by online-go (OGS) game link / url.
        """
        # parse the OGS game id from the url
        m = regex_ogs_url.match(api.payload['ogs_game_url'])
        if m is None:
            return 'Invalid OGS url.', 400
        ogs_game_id = m.group(1)

        # fetch SGF via the OGS API
        r = requests.get('https://online-go.com/api/v1/games/%s/sgf' % ogs_game_id)
        if r.status_code != 200:
            return 'Unable to load the OGS game.', 400
        raw_sgf_bytes = r.content

        game_id, return_code = _add_sgf_game_to_db(raw_sgf_bytes, True, 'OGS Game %s' % ogs_game_id)

        return {'game_id': game_id}, return_code
