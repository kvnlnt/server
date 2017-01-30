PID="$(lsof -n -i:3333 | grep LISTEN | awk '{ print $2 }' | xargs)"
if [ ${PID:+1} ]
then
    kill -9 $PID
fi
