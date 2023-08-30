#!/bin/sh

set -x -e

tagList=$(curl -L -s 'https://hub.docker.com/v2/repositories/matrixorigin/matrixone/tags?page_size=1')

lastUpdate=$(echo "${tagList}" | jq '.results[0].last_updated' | tr -d '"')
lastUpdateSeconds=$(date +%s -d "${lastUpdate}")
newTag=$(echo "${tagList}" | jq '.results[0].name' | tr -d '"')

echo "${newTag}"

halfday=43200
now=$(date +%s)
diffSeconds=$((${now}-${lastUpdateSeconds}))
if [ ${diffSeconds} > ${halfday} ]; then
        echo "latest image is 12 hours ago, skip updating"
        #exit 0
fi

sed -E -i s/"^(  version: nightly-[0-9a-z]{8})"/"  version: ${newTag}"/ ./resources/freetier-01.yaml

cat ./resources/freetier-01.yaml
