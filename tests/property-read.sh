#!/bin/bash

PAYLOAD='{"resource":"/property/read","payload":"world"}'
TEST="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$TEST" = "world" ]
then
    PASSED+=('Can read property')
else 
    FAILED+=('Can read property')
fi