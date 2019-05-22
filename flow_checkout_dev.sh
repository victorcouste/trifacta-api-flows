
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='vcoustenoble@trifacta.com:victor'
HOST='http://localhost:3005'


# Import a flow, a zip package
ENDPOINT="/v4/flows/package/"
# POST : data / "@path-to-flow.zip"
#curl -X POST http://example.com:3005/v4/flows/package \
#  -H 'authorization: Basic YWRtaW5AdHJpZmFjdGEubG9jYWw6YWRtaW4=' \
#  -H 'cache-control: no-cache' \
#  -H 'content-type: multipart/form-data' \
#  -F data=@path/to/flow.zip


git pull = git fetch + git merge


response=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: application/json" --request POST)

echo "job response => $response"