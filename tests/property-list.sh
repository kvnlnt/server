#!/usr/bin/env

TEST="Can list properties"
PAYLOAD="$(jq '.' ./tests/property-list.json -c)"
RESULT=$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} "http://localhost:3333")
TEST_1="$(echo $RESULT | jq '.status' | xargs)"
if [ "$TEST_1" = "OK" ]
then
    PASSED+=("$TEST")
else 
    FAILED+=("$TEST")
fi