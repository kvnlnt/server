#!/bin/bash

PAYLOAD='{"resource":"/property/create","payload":"world"}'
TEST="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$TEST" = "world" ]
then
    PASSED+=("Can create property")
else 
    FAILED+=("Can create property")
fi