SECOND=$(date '+%S')
MINUTE=$(date '+%M')
HOUR=$(date '+%H')
DAY=$(date '+%d')
MONTH=$(date '+%m')
YEAR=$(date '+%Y')
mkdir -p ./logs
# append output to log
nohup node server >> ./logs/$MONTH$YEAR'.out' 2>&1&