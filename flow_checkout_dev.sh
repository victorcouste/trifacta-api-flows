#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='victor@trifacta.local:victor'
HOST='http://dev_env_server:3005'
#HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")

echo

if (( $# < 4 ));
	then
		echo "Please call '$0 -f <flow_id> -p <folder_id>' to run this command"
		echo
		exit 1
   else

		while getopts f:p: option 
		do 
 			case "${option}" 
 			in 
 			f) flow_id=${OPTARG};; 
 			p) folder_id=${OPTARG};; 
 			esac 
		done
	fi

echo "Flow ID : "$flow_id
echo "Folder ID : "$folder_id

# -------------  Checkout last version of the flow flow_id ---------------

git fetch
git checkout origin/master -- flows/flow_$flow_id.zip

echo
ls -ls ./flows/flow_$flow_id.zip
echo
# ------------- Import a flow (zip package) in dev env folder ---------------

# Import a flow, a zip package
ENDPOINT="/v4/flows/package/?folderId=$folder_id"
# POST : data / "@path-to-flow.zip"
#curl -X POST http://example.com:3005/v4/flows/package \
#  -H 'authorization: Basic YWRtaW5AdHJpZmFjdGEubG9jYWw6YWRtaW4=' \
#  -H 'cache-control: no-cache' \
#  -H 'content-type: multipart/form-data' \
#  -F data=@path/to/flow.zip

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: multipart/form-data" --request POST -F data=@flows/flow_$flow_id.zip
echo

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT --header "Content-Type: multipart/form-data" --request POST -F data=@flows/flow_$flow_id.zip)

echo
echo "Import result => $output"
