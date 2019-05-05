#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Database connection management.
"""
import pymongo

MONGODB_SERVER_ADDRESS = 'lz_api_mongodb'
MONGODB_SERVER_PORT = 27017

_DB_CUR = None


def get_database_connection():
    """
    Returns the current database connection.
    """
    global _DB_CUR

    if _DB_CUR is None:
        client = pymongo.MongoClient(MONGODB_SERVER_ADDRESS,
                                     MONGODB_SERVER_PORT)
        _DB_CUR = client.dht22_database

    return _DB_CUR
