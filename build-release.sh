#!/bin/bash

if [ $# -lt 1 ]; then 
	echo "Usage: $0 TAG"
	exit 0 
fi

cd /root/build
rm -rf *
git clone --single-branch --branch $1 https://github.com/FabianHahn/shoveler-spatialos
cd shoveler-spatialos
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)

