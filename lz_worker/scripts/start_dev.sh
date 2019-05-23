#!/bin/sh
# Run the worker container with the local scripts for development / debugging
# in the docker-compose network.

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

docker run --rm -it \
    --network leelazeroserver_default \
    -e API_SERVER=lz_api \
    -e API_PORT=5000 \
    -v $SCRIPTPATH/../src:/opt/lz_worker \
    --name lz_worker \
    lz_worker:latest \
    /bin/bash
