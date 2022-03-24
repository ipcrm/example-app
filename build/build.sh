#!/bin/bash

# NOTE - The following versions are no longer on maven central
# 1.8:1.1.3 1.11:1.1.3 1.8:1.2.17 1.11:1.2.17

# This is the shorter listing of terminal releases for each minor
for i in 1.8:2.17.0 1.11:2.17.0 1.8:2.16.0 1.11:2.16.0 1.8:2.15.0 1.11:2.15.0 1.8:2.14.1 1.11:2.14.1 1.8:2.13.1 1.11:2.13.1 1.8:2.12.1 1.11:2.12.1 1.8:2.11.2 1.11:2.11.2 1.8:2.10.0 1.11:2.10.0 1.8:2.9.1 1.11:2.9.1 1.8:2.8.2 1.11:2.8.2 1.8:2.7 1.11:2.7 1.8:2.6.2 1.11:2.6.2 1.8:2.5 1.11:2.5 1.8:2.4.1 1.11:2.4.1 1.8:2.3 1.11:2.3 1.8:2.2 1.11:2.2 1.8:2.1 1.11:2.1 1.8:2.0.2 1.11:2.0.2 1.8:2.0-rc2 1.11:2.0-rc2 1.8:2.0-beta9 1.11:2.0-beta9
do
  SOURCECOMPAT=$(echo $i | cut -d ':' -f 1)
  LOG4JVERSION=$(echo $i| cut -d ':' -f 2)

  DOCKERFILE=build/Dockerfile
  if [ $SOURCECOMPAT == "1.11" ]; then
    DOCKERFILE=build/Dockerfile11
  fi

  DOCKER_BUILDKIT=1 docker build --build-arg LOG4J_VERSION=$LOG4JVERSION --build-arg SOURCE_COMPAT=$SOURCECOMPAT --file $DOCKERFILE --output out .
  if [ $? -ne 0 ]; then
    echo "Failed to build image!"
    exit 1
  fi
done
