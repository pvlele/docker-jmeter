#!/bin/bash

JMETER_VERSION="5.4.1"
PLUGIN_VERSION="1.6"
CMDRUNNER_VERSION="2.2"

# Example build line

docker build  --build-arg JMETER_VERSION=${JMETER_VERSION} \
              --build-arg PLUGIN_VERSION=${PLUGIN_VERSION} \
              --build-arg CMDRUNNER_VERSION=${CMDRUNNER_VERSION} \
              -t "pvlele/jmeter:${JMETER_VERSION}" .
