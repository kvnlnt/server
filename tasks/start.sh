DAY=$(date '+%d')
MONTH=$(date '+%m')
YEAR=$(date '+%Y')
nohup node server > ./logs/$MONTH$YEAR'.out' 2>&1&