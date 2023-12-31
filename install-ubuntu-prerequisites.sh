# /bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt install libncurses5 libtommath1 -y
sudo ln -f -s libtommath.so.1 /usr/lib/x86_64-linux-gnu/libtommath.so.0
