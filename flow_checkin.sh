
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='admin@trifacta.local:admin'
HOST='http://localhost:3005'
#HOST='http://trifacta601.francecentral.cloudapp.azure.com:3005'

time=$(date +"%d-%m-%y %T")

# ------------- Export a flow (zip package) ---------------

if [ -z "$1" ]
  then
    echo "\nPlease call '$0 <flow_id>' to run this command\n"
	exit 1
   else
    flow_id=$1
fi

echo
echo "Flow ID : "$flow_id

ENDPOINT="/v4/flows/$flow_id/package"
# GET : result is a zip file

echo
echo $CURL --user $CREDENTIALS $HOST$ENDPOINT -o flow_$flow_id/flow_$flow_id.zip
echo

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT -o flow_$flow_id/flow_$flow_id.zip)

echo
ls -ls ./flow_$flow_id/flow_$flow_id.zip

# -------------  Commit and Push in Github  ---------------

git add flow_$flow_id/flow_$flow_id.zip
echo
git commit -m "Version $time"
echo
git push