# Run the dev container in this directory and in the leelazeroserver_default
# network generated by docker-compose.
#
# Created a new Vue.js project via
# vue create --default -m npm --no-git lz_frontend
# Afterwards, copy the newly generated lz_frontend/ contents to this level and
# allowed the dev container Dockerfile.dev to install its dependencies.
#
# Run the service in a development mode:
# npm run serve

PWD=`pwd`

docker run --rm -it -v $PWD:/src -p 8080:8080 --network leelazeroserver_default lz_dev:latest /bin/bash