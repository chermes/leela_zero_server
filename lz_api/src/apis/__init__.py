from flask_restplus import Api

from .game import api as ns_game

api = Api(
    title='Go Game Analysis API',
    version=1.0,
    description='Basic Go Game Analysis API',
)

api.add_namespace(ns_game)

