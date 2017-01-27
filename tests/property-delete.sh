#!/bin/bash

PAYLOAD='{"resource":"/property/delete","payload":"world"}'
TEST="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$TEST" = "world" ]
then
    PASSED+=('Can delete property')
else 
    FAILED+=('Can delete property')
fi