#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Database connection management.
"""
import os

import pymongo

MONGODB_SERVER_PORT = 27017

_DB_CUR = None


def get_database_connection():
    """
    Returns the current go database connection and the corresponding games collection.
    """
    global _DB_CUR

    try:
        mongodb_server = os.environ['MONGODB_SERVER']
    except KeyError:
        mongodb_server = 'localhost'

    if _DB_CUR is None:
        client = pymongo.MongoClient(mongodb_server, MONGODB_SERVER_PORT)
        _DB_CUR = client.go_database

    coll = _DB_CUR.games_collection

    return _DB_CUR, coll
