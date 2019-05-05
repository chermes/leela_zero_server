#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Main entry point of the lz_api service.
"""
from flask import Flask
from flask_cors import CORS
from apis import api


if __name__ == "__main__":
    app = Flask(__name__)
    CORS(app)

    api.init_app(app)

    app.run(host='0.0.0.0', debug=False)
