#!/usr/bin/env

TEST="System: Can respond"
PAYLOAD="$(cat ./tests/system-health.json | jq '.' -c)"
RESULT="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$RESULT" = "OK" ]
then
    PASSED+=("$TEST")
else 
    FAILED+=("$TEST")
fi