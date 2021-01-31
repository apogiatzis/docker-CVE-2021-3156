#!/bin/bash

wget https://www.sudo.ws/dist/sudo-1.8.31.tar.gz

tar -xf sudo-1.8.31.tar.gz
cd sudo-1.8.31/
mkdir build
cd build/
../configure --enable-env-debug
make -j
make install