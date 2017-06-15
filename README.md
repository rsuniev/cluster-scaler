### cluster-scaler
Docker container to scale up/down the AWS ASG with cron.

## Docker Container
### Latest
```
docker pull rustemsuniev/cluster-scaler:latest
docker run -e ASG="ASG_ID" -e DESIRED_CAPACITY="ASG-DESIRED-CAPACITY" -e ACTION_TYPE="SCALE_DOWN|SCALE_UP" -e CRON_ENTRY="* * * * *"
```

Scheduling time can be controlled using standard [cron](https://en.wikipedia.org/wiki/Cron) expressions

Note: Downscaling action happens immediately while upscaling action has 30 seconds delay before a next node is added to ASG.
