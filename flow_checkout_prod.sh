
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='vcoustenoble@trifacta.com:victor'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")


# -------------  Checkout last version of the flow ---------------

git fetch
git checkout origin/master -- flow.zip


# ------------- Imprt a flow (zip package) in dev env in a folder ---------------

deploy_id=1

# Deploy a flow package
ENDPOINT="/v4/deployments/$deploy_id/releases"
# POST : data / "@path-to-flow.zip"
#curl -X POST http://example.com:3005/v4/deployments/3/releases \
#  -H 'authorization: Basic YWRtaW5AdHJpZmFjdGEubG9jYWw6YWRtaW4=' \
#  -H 'cache-control: no-cache' \
#  -H 'content-type: multipart/form-data' \
#  -F data=@path/to/flow.zip

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: multipart/form-data" --request POST -F data=flow.zip

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: multipart/form-data" --request POST -F data=flow.zip)

echo "Import result => $output"