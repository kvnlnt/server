#!/usr/bin/env

# give server a chance to start
sleep 1

# time how long it takes to execute under load
time {


    PAYLOAD="$(jq '.' ./tests/property-read.json -c)"

    # Number of consecutive users
    for i in `seq 1 30`;
    do
        # number of consecutive requests
        curl -s -H "Content-Type: application/json" -X POST -d ${PAYLOAD} "http://localhost:3333?[1-10]" &
        pidlist="$pidlist $!"
        let "USERS+=1"
        let "REQS+=10"
    done  

    # check for failures
    for job in $pidlist; do 
      echo $job   
      wait $job || let "FAIL+=1" 
    done  

    # report
    echo "FAIL: $FAIL, REQS:$REQS, USERS:$USERS" 
}
