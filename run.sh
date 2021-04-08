#!/bin/bash

# Run JMeter Docker image with options

NAME="jmeter"
IMAGE="pvlele/jmeter:5.4.1"

docker stop ${NAME} > /dev/null 2>&1
docker rm ${NAME} > /dev/null 2>&1
docker run --name ${NAME} -it -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} ./test.sh

#to run in terminal mode comment above line and uncomment below line
# sudo docker run --name ${NAME} -it -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} $@
