#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Status entry point.
"""
from flask_restplus import Resource, fields, Namespace

from . import db_conn

api = Namespace('status', description='Game status.')

