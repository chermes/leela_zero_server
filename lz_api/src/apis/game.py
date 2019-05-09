#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
game/ entry point.
"""
import uuid
import datetime

from flask_restplus import Resource, fields, Namespace

from . import db_conn

api = Namespace('game', description='Game information and changes.')

status_model = api.model('Status', model={
    'is_finished': fields.Boolean(required=True,
                                  description='Is the analyze finished?',
                                  example=False),
    'is_running': fields.Boolean(required=True,
                                 description='Is the analyze currently running?',
                                 example=True),
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
                                example='(;GM[1]FF[4]AP[qGo:2.1.0]ST[1] SZ[19]HA[0]KM[5.5]PW[White]PB[Black] ;B[pd])'),
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


@api.route('/list/all')
class ListAll(Resource):
    @api.marshal_list_with(game_model)
    def post(self):
        """
        Returns all available games in the database sorted by creation date.
        """
        _, coll = db_conn.get_database_connection()

        games = list(coll.find({}, sort=[('creation_date', 1)]))

        for game in games:
            game['game_id'] = game['_id']

        return games, 200


@api.route('/list/needs_analysis')
class ListAll(Resource):
    @api.marshal_list_with(game_model)
    @api.response(204, 'No available game could be found.')
    def post(self):
        """
        Returns the next game which still need an analysis (FIFO).
        """
        _, coll = db_conn.get_database_connection()

        game = coll.find_one({'status.is_finished': False,
                              'status.is_running': False},
                             sort=[('creation_date', 1)])

        if game is None:
            return 'No game found.', 204

        game['game_id'] = game['_id']

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
    def post(self):
        """
        Upload a SGF by raw string.
        """
        game_id = uuid.uuid4().hex

        game = {
            '_id': game_id,
            'name': 'Raw SGF upload',
            'sgf_orig': api.payload['sgf_string'],
            'creation_date': datetime.datetime.now(),
            'status': {
                'is_finished': False,
                'is_running': False
            },
            'sgf_analyzed': None,
            'win_rate': None,
        }

        # insert game into the db
        _, coll = db_conn.get_database_connection()
        coll.insert_one(game)

        return {'game_id': game_id}, 200
