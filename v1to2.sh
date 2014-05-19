#!/bin/sh

set -e

STARTDIR=`pwd`

/tmp/elevators/bin/elevators-1 stop || echo "No previous node running."
rm -rf /tmp/elevators
rm -rf _rel

make rel1

echo "Backup version 1..."
mv src/elevators.app.src src/elevators.app.src.v1
mv src/scheduler.erl src/scheduler.erl.v1

echo "Copy over upgrade..."
cp upgrade/elevators.app.src src/
cp upgrade/scheduler.erl src/
cp upgrade/elevators.appup ./ebin/

make rel2

echo "Back to version 1..."
mv src/elevators.app.src.v1 src/elevators.app.src
mv src/scheduler.erl.v1 src/scheduler.erl

mkdir -p /tmp/elevators
cp _rel/elevators/elevators-1.tar.gz /tmp
cp _rel/elevators/elevators-2.tar.gz /tmp/elevators-2.tar.gz

cd /tmp/elevators
tar xf /tmp/elevators-1.tar.gz

echo "Starting node..."
./bin/elevators-1 start

mkdir -p releases/2
cp /tmp/elevators-2.tar.gz releases/2/elevators.tar.gz

sleep 5s # let the system boot

echo "Upgrading node to version 2..."
./bin/elevators-1 upgrade "2/elevators"

rm /tmp/elevators-1.tar.gz
rm /tmp/elevators-2.tar.gz

cd $STARTDIR
