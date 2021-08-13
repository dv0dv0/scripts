#!/bin/bash

MYDATE=$(date +%Y-%m-%dT%H:%M:%S%z)
STREAMKEY=$1
SOURCE=$2
STATUS=active

JSON_STRING=$( jo -p \
        streamkey=$(jo S=$STREAMKEY) \
        srce=$(jo S=$SOURCE) \
        timestamp=$(jo S=$MYDATE) \
        status=$(jo S=$STATUS) \
        )

aws dynamodb put-item --table-name streammeta --item "$JSON_STRING"
