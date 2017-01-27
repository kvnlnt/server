#!/bin/bash

##
## PARAMS
##

PASSED=()
FAILED=()

##
## START SERVER
##
node server &
background_pid=$!

##
## TESTS
##

. tests/property-create.sh
# . tests/property-read.sh
# . tests/property-update.sh
# . tests/property-delete.sh


##
## KILL SERVER
##
kill -2 "$background_pid"
kill -15 "$background_pid"

##
## RESULTS
##

echo
echo "\x1b[32;01mPASSED\x1b[0m"
for i in "${PASSED[@]}"
do
    echo $i
done

echo
echo "\x1b[31;01mFAILED\x1b[0m"
for i in "${FAILED[@]}"
do
    echo $i
done
echo
