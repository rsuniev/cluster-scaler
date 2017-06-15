#!/bin/bash
export PATH=$PATH:/usr/local/bin
aws configure set default.region eu-west-1

if [ "ACTION_TYPE" == "SCALE_DOWN" ]
then

  echo "Scaling compute ASG to DESIRED_CAPACITY"
  aws autoscaling update-auto-scaling-group --auto-scaling-group-name=ASG --min-size DESIRED_CAPACITY --desired-capacity DESIRED_CAPACITY
  echo "Done"

elif [ "ACTION_TYPE" == "SCALE_UP" ]
then

  current_capacity=$(aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name=ASG | jq .AutoScalingGroups[0].DesiredCapacity)
  while [ $current_capacity -lt DESIRED_CAPACITY ]
  do
    new_capacity=`expr $current_capacity + 1`
    echo "Setting a new cluster capacity to: $new_capacity"
    aws autoscaling update-auto-scaling-group --auto-scaling-group-name=ASG --min-size $new_capacity --desired-capacity $new_capacity
    sleep 30s
    current_capacity=$(aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name=ASG | jq .AutoScalingGroups[0].DesiredCapacity)
  done
  echo "Done"

else

  echo "Unknown action type: ACTION_TYPE"

fi
