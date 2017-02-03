# ab -k -n 1000 -c 100 -T "application/json" -p "./tests/system-health.json" http://localhost:3333/
# loadtest --concurrency 10 --maxRequests 10 --contentType "application/json" --postFile "./tests/system-health.json" http://localhost:3333/
make app:restart
sleep 2
loadtest --rps 100 -n 5000 -c 100 -T "application/json" -p "./tests/system-health.json" http://localhost:3333/