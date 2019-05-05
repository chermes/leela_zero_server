# Leela Zero Analyse Server

A local Go game analyse server using the Leela Zero engine.

It provides a set of Docker containers to upload and analyse Go games (SGF
files) by using the following modules:
* Leela Zero engine (lz_worker/)
* RestApi interface (lz_api/) + MongoDB database
* Minimal web frontend (lz_frontend/)

A word of warning: This is not meant to be run as public service since it has
no authentication build into it!

## Requirements
* Docker
* docker-compose

## Installation

* `git clone https://github.com/chermes/leela_zero_server.git`
* `cd leela_zero_server/`
* `docker-compose build`

## Run the Service

* `docker-compose up`

## Use the Service

TODO
