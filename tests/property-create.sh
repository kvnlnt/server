#!/usr/bin/env

TEST="Can create property"
PAYLOAD="$(cat ./tests/property-create.json | jq '.' -c)"
RESULT="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$RESULT" = "world" ]
then
    PASSED+=("$TEST")
else 
    FAILED+=("$TEST")
fi