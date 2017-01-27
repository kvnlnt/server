#!/bin/bash

TEST="Can delete property"
PAYLOAD='{"resource":"/property/delete","payload":"world"}'
RESULT="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$RESULT" = "wrong" ]
then
    PASSED+=("$TEST")
else 
    FAILED+=("$TEST")
fi