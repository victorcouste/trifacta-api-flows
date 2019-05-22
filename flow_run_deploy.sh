
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='vcoustenoble@trifacta.com:victor'
HOST='http://localhost:3005'
id_deploy=5
ENDPOINT="/v4/deployments/$id_deploy/run"

response=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: application/json" --request POST)

echo "job response => $response"