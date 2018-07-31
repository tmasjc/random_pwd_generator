#!/bin/bash

# to start a Mongo container during development stage
docker run --rm -it -dp 27017:27017 \
	--name some-mongo \
	-e MONGO_INITDB_ROOT_USERNAME=admin \
	-e MONGO_INITDB_ROOT_PASSWORD=example \
	mongo

