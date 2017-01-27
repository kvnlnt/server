##
## PARAMS
##

SUCCEEDED=()
FAILED=()


##
## TESTS
##

# test
PAYLOAD='{"resource":"/","payload":{}}'
TEST="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$TEST" = "world" ]
then
    SUCCEEDED+=('test 1')
else 
    FAILED+=('test 1')
fi

# test
PAYLOAD='{"resource":"/","payload":{}}'
TEST="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$TEST" = "world2" ]
then
    SUCCEEDED+=('test 2')
else 
    FAILED+=('test 2')
fi

# test
PAYLOAD='{"resource":"/","payload":{}}'
TEST="$(curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} http://localhost:3333 | jq '.payload' | xargs)"
if [ "$TEST" = "world" ]
then
    SUCCEEDED+=('test 3')
else 
    FAILED+=('test 3')
fi

##
## RESULTS
##

echo
echo "\x1b[32;01mSUCCEEDED\x1b[0m"
for i in "${SUCCEEDED[@]}"
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
