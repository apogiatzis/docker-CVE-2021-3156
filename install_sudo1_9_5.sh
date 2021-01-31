#!/bin/bash

wget https://github.com/sudo-project/sudo/archive/SUDO_1_9_5.tar.gz

tar -xf SUDO_1_9_5.tar.gz
cd sudo-SUDO_1_9_5/
mkdir build
cd build/
../configure --enable-env-debug
make -j
make install