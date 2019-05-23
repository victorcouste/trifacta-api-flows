
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='deploy@trifacta.local:deploy'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")


# ------------- Run active flow from a deployment project ---------------

deploy_id=1

# Deploy a flow package
ENDPOINT="/v4/deployments/$deploy_id/run"
# POST

#curl -X POST http://example.com:3005/v4/deployments/3/run

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --request POST

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT --request POST)

echo "Run result => $output"