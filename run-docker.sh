#!/bin/bash

if [ $# -lt 2 ]; then 
	echo "Usage: $0 BUILD_DIRECTORY TAG"
	exit 0 
fi

spatial auth logout && spatial auth login

BUILD_DIR=$(readlink -f $1)
AUTH_DIR=~/.improbable

rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}

docker build -t shoveler-spatialos-release .
docker run --user `id -u`:`id -g` -v ${BUILD_DIR}:/home/build/build -v "${AUTH_DIR}:/home/build/.improbable" -i -t shoveler-spatialos-release /home/build/build-release.sh $2

