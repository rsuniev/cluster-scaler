#!/usr/bin/bash
echo "Scaling compute ASG to 1"
aws-retry.sh aws autoscaling set-desired-capacity --auto-scaling-group-name=$ASG  --desired-capacity 1
echo "Done"
