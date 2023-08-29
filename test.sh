#!/bin/sh

now=$(date +%s)

tagList=$(curl -L -s 'https://hub.docker.com/v2/repositories/matrixorigin/matrixone/tags?page_size=1')

lastUpdate=$(echo "${tagList}" | jq '.results[0].last_updated' | tr -d '"')
lastUpdateSeconds=$(date +%s -d "${lastUpdate}")
newTag=$(echo "${tagList}" | jq '.results[0].name')



echo "${newTag}"

halfday=43200

diffSeconds=$((${now}-${lastUpdateSeconds}))

echo ${diffSeconds}