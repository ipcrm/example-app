#!/bin/bash

if [ -z $1 ]; then
  echo "SUPPLY JDK compatibility version in the form of 1.8, 1.11"
  exit 1
fi
if [ -z $2 ]; then
  echo "SUPPLY LOG4JVERSION version in the form of 2.6.1"
  exit 1
fi

SOURCECOMPAT=$1
LOG4JVERSION=$2

DOCKERFILE=build/Dockerfile
if [ $SOURCECOMPAT == "1.11" ]; then
  DOCKERFILE=build/Dockerfile11
fi

DOCKER_BUILDKIT=1 docker build --build-arg LOG4J_VERSION=$LOG4JVERSION --build-arg SOURCE_COMPAT=$SOURCECOMPAT --file $DOCKERFILE --output out .
