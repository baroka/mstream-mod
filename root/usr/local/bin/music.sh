#!/bin/sh
# Script for index new music for mstream
# Executed after adding new music to shared folder

# Files
watchDir="/music"

update_index() {
	# Index missing directory or files
	echo "index database.."
	#local mstream=`docker network inspect t2_proxy | jq '.[].Containers[] | select(.Name == "mstream") | .IPv4Address' | awk -F[\"\/] '{print $2}'`
	local endpoint=http://localhost:3000/api/v1/admin/db/scan/all
	#curl http://172.18.0.16:3000/api/v1/db/status
	curl -X POST -H "Content-Type: application/json" $endpoint
}

inotifywait -m -e create,delete,move,modify,attrib $watchDir | while read line; do
  echo "changes detected.. ${line}"
  update_index
done