#!/bin/bash

PAYLOAD='{"resource":"/property/update","payload":"world"}'
TEST="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$TEST" = "world" ]
then
    PASSED+=('Can update property')
else 
    FAILED+=('Can update property')
fi