#!/bin/bash

##
## PARAMS
##

PASSED=()
FAILED=()

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
