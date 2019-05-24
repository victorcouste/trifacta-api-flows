
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='admin@trifacta.local:admin'
HOST='http://localhost:3005'
#HOST='http://trifacta601.francecentral.cloudapp.azure.com:3005'

time=$(date +"%d-%m-%y %T")

# ------------- Export a flow (zip package) ---------------

if [ -z "$1" ]
  then
    echo "\nPlease call '$0 <argument>' to run this command\n"
	exit 1
   else
    flow_id=$1
fi


ENDPOINT="/v4/flows/$flow_id/package"
# GET : result is a zip file

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT -o flow_$flow_id/flow_$flow_id.zip

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT -o flow_$flow_id/flow_$flow_id.zip)

#output=$( $CURL -sw '%{http_code}' --user $CREDENTIALS $HOST$ENDPOINT)
#response=$(curl -L -s -o $file -z $file $url -w "%{http_code}")
#echo $http_code

#if [ $output <> "\"Failed\"" ]
#then
#    echo "jjj"
#else
	# $output > flow.zip
#fi

# -------------  Commit and Push in Github  ---------------

git add /flow_$flow_id/flow_$flow_id.zip
git commit -m "Version $time"
git push