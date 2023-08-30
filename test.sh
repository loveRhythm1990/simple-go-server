#!/bin/sh

set -x -e

echo "$@"

replaceClusterVersion() {
  echo "replaceClusterVersion args: " "$@"
  clusterName=$1
  newVersion=$2
  sed -E -i s/"^(  version: nightly-[0-9a-z]{8})"/"  version: ${newVersion}"/ ./resources/"${clusterName}".yaml
}

if [ $# -ge 2 ]; then
    replaceClusterVersion "$1" "$2"
    exit 0
fi


# fetch latest version from docker hub
tagList=$(curl -L -s 'https://hub.docker.com/v2/repositories/matrixorigin/matrixone/tags?page_size=1')
lastUpdate=$(echo "${tagList}" | jq '.results[0].last_updated' | tr -d '"')
lastUpdateSeconds=$(date +%s -d "${lastUpdate}")
newTag=$(echo "${tagList}" | jq '.results[0].name' | tr -d '"')

echo "${newTag}"

# only update cluster if the fetched tag is updated in 6 hours
sixHours=21600
now=$(date +%s)
diffSeconds=$((now-lastUpdateSeconds))
if [ ${diffSeconds} > ${sixHours} ]; then
        echo "latest image is 6 hours ago, skip updating"
        exit 0
else
    replaceClusterVersion "freetier-01" "${newTag}"
fi

cat ./resources/freetier-01.yaml