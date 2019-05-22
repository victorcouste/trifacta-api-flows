
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='admin@trifacta.local:admin'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")

# ------------- Export a flow (zip package) ---------------

id_flow=6

ENDPOINT="/v4/flows/$id_flow/package"
# GET : result is a zip file

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT)

echo "$output" > "flow.zip"

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

git add flow.zip
git commit -m "Version $time"
git push