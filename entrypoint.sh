#!/bin/bash

trap exit SIGINT
trap exit SIGTERM

touch /var/log/cron.log
export PATH=$PATH:/usr/local/bin
sed -i 's/ASG/'"$ASG"'/' /run.sh
sed -i 's/DESIRED_CAPACITY/'"$DESIRED_CAPACITY"'/g' /run.sh
sed -i 's/ACTION_TYPE/'"$ACTION_TYPE"'/' /run.sh
echo "$CRON_ENTRY /run.sh >> /var/log/cron.log 2>&1" | crontab -
cron -f
