#!/usr/bin/env

##
## PARAMS
##

PASSED=()
FAILED=()

sleep 1 # give server chance to start

##
## TESTS
##

. tests/system-health.sh
. tests/property-create.sh
. tests/property-read.sh
. tests/property-list.sh
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

