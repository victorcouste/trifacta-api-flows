#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='admin@trifacta.local:admin'
HOST='http://localhost:3005'
#HOST='http://trifacta601.francecentral.cloudapp.azure.com:3005'

time=$(date +"%d-%m-%y %T")

# -------------  Checkout last version of the flow flow_id ---------------

flow_id=9

git fetch
git checkout origin/master -- flow_$flow_id.zip


# ------------- Import a flow (zip package) in dev env folder ---------------

folder_id=1

# Import a flow, a zip package
ENDPOINT="/v4/flows/package/?folderId=$folder_id"
# POST : data / "@path-to-flow.zip"
#curl -X POST http://example.com:3005/v4/flows/package \
#  -H 'authorization: Basic YWRtaW5AdHJpZmFjdGEubG9jYWw6YWRtaW4=' \
#  -H 'cache-control: no-cache' \
#  -H 'content-type: multipart/form-data' \
#  -F data=@path/to/flow.zip

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: multipart/form-data" --request POST -F data=@flow_$flow_id.zip

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: multipart/form-data" --request POST -F data=@flow_$flow_id.zip)

echo "Import result => $output"
