#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Main entry point of the lz_api service.
"""
import argparse

from flask import Flask
from flask_cors import CORS
from apis import api


if __name__ == "__main__":
    parser = argparse.ArgumentParser('Leela Zero Analysis API')
    parser.add_argument('--port', type=int, default=5000,
                        help='Port number for this api being accessible. (default: %(default)s)')
    args = parser.parse_args()

    app = Flask(__name__)
    CORS(app)

    api.init_app(app)

    app.run(host='0.0.0.0', port=args.port, debug=False)
