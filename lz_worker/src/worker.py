#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Small worker script which checks for new available Go games and runs the Leela
Zero analysis if not already done so.
"""
import sys
import os
import time
import logging

import requests

if __name__ == "__main__":
    try:
        api_server = os.environ['API_SERVER']
    except KeyError:
        api_server = 'localhost'
    try:
        api_port = int(os.environ['API_PORT'])
    except KeyError:
        api_port = 5000
    print(f'Using now the api server address {api_server}:{api_port}')
    api_address = f'http://{api_server}:{api_port}'

    connected = False
    while not connected:
        try:
            r = requests.post(api_address + '/game/is_alive')
            if r.status_code == 200:
                connected = True
        except:
            connected = False

        if not connected:
            print(f'Failed to connect to the api server {api_address}. Try to re-connect in 5.')
            time.sleep(5)

    print(f'Connection to the api server {api_address} succeeded.')

    while True:
        r = requests.post(api_address + '/game/reserve_for_analysis')
        if r.status_code == 204:
            pass
        elif r.status_code == 200:
            game = r.json()

            #  TODO: process that game <09-05-19, Christoph Hermes> # 
            print('LEELA PROCESSING...')
            time.sleep(10)
            print('LEELA PROCESSING... Done.')

            # update game status
            game['status']['is_finished'] = True
            game['status']['is_running'] = False
            # TODO: update analysed game info <09-05-19, Christoph Hermes> # 
            requests.post(api_address + '/game/update', json=game)

        else:
            logging.error(f'Could not connect to the api {api_address}.')
            sys.exit(-1)

        time.sleep(5)
