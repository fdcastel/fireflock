# /bin/bash

. ./settings.sh

rm -rf $FIREFLOCK_ROOT
mkdir -p $FIREFLOCK_ROOT

curl -s -L $FB50_URL | tar x -v --gzip --directory=$FIREFLOCK_ROOT --
curl -s -L $FB40_URL | tar x -v --gzip --directory=$FIREFLOCK_ROOT --
curl -s -L $FB30_URL | tar x -v --gzip --directory=$FIREFLOCK_ROOT --
curl -s -L $FB25_URL | tar x -v --gzip --directory=$FIREFLOCK_ROOT --

find $FIREFLOCK_ROOT -name '*.tar.gz' -execdir tar x -v --gzip --file='{}' \;
