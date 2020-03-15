#!/bin/bash

if [ $# -lt 2 ]; then 
	echo "Usage: $0 BUILD_DIRECTORY TAG"
	exit 0 
fi

spatial auth logout && spatial auth login

BUILD_DIR=$(readlink -f $1)
AUTH_DIR=~/.improbable

mkdir -p ${BUILD_DIR}

docker build -t shoveler-spatialos-release .
docker run -v ${BUILD_DIR}:/root/build -v "${AUTH_DIR}:/root/.improbable" -i -t shoveler-spatialos-release /root/build-release.sh $2

