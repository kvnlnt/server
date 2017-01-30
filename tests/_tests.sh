#!/bin/bash

##
## PARAMS
##

PASSED=()
FAILED=()

##
## START SERVER
##
# nohup node server </dev/null >/dev/null 2>&1 & # detached w/ no output
nohup node server > './tests/_tests.out' 2>&1&
PID=$! # capture process id
sleep 1 # give server chance to start

##
## TESTS
##

. tests/property-create.sh
. tests/property-read.sh
. tests/property-update.sh
. tests/property-delete.sh

##
## RESULTS
##

for i in "${PASSED[@]}"
do
    echo "\x1b[32;01m \xE2\x9C\x93 \x1b[0m $i"
done

for i in "${FAILED[@]}"
do
    echo "\x1b[31;01m X \x1b[0m $i"
done

##
## KILL SERVER
##
kill -2 "$PID"
kill -15 "$PID"

