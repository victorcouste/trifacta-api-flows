
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='deploy@trifacta.local:deploy'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")


# -------------  Checkout last version of the flow ---------------

git fetch
git checkout origin/master -- flow.zip


# ------------- Import a flow (zip package) in deployment project ---------------

deploy_id=1

# Deploy a flow package
ENDPOINT="/v4/deployments/$deploy_id/releases"
# POST : data / "@path-to-flow.zip"
#curl -X POST http://example.com:3005/v4/deployments/3/releases \
#  -H 'authorization: Basic YWRtaW5AdHJpZmFjdGEubG9jYWw6YWRtaW4=' \
#  -H 'cache-control: no-cache' \
#  -H 'content-type: multipart/form-data' \
#  -F data=@path/to/flow.zip

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: multipart/form-data" --request POST -F data=@flow.zip

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: multipart/form-data" --request POST -F data=@flow.zip)

echo "Deploy result => $output"