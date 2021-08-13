#!/bin/bash

MYDATE=$(date +%Y-%m-%dT%H:%M:%S%z)
STREAMKEY=$1
SOURCE=$2
STATUS=active
MYIP=$(hostname -i)

JSON_STRING=$( jo -p \
        streamkey=$(jo S=$STREAMKEY) \
        srce=$(jo S=$SOURCE) \
        rtmpip=$(jo S=$MYIP) \
        timestamp=$(jo S=$MYDATE) \
        status=$(jo S=$STATUS) \
        )

aws dynamodb put-item --table-name streammeta --item "$JSON_STRING"
