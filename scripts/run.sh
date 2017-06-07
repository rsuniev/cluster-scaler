#!/usr/bin/bash

if [ "$ACTION_TYPE" == "SCALE_DOWN" ]
then
  source scripts/scale_down.sh
elif [ "$ACTION_TYPE" == "SCALE_UP" ]
then
  source scripts/scale_up.sh
else
  echo "Unknown action type: $ACTION_TYPE"
fi
