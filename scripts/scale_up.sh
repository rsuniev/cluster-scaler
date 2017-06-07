#!/usr/bin/bash

current_capacity=$(aws-retry.sh aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name=${ASG}| jq .AutoScalingGroups[0].DesiredCapacity)
while [ $current_capacity -lt $DESIRED_CAPACITY ]
do
  new_capacity=`expr $current_capacity + 1`
  echo "Setting a new cluster capacity to: $new_capacity"
  aws-retry.sh aws autoscaling set-desired-capacity --auto-scaling-group-name=$ASG  --desired-capacity $new_capacity
  sleep 30s
  current_capacity=$(aws-retry.sh aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name=${ASG}| jq .AutoScalingGroups[0].DesiredCapacity)
done
echo "Done"
