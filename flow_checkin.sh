
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='admin@trifacta.local:admin'
HOST='http://localhost:3005'

# ------- Export a flow, a zip package

id_flow=6

ENDPOINT="/v4/flows/$id_flow/package"
# GET : result is a zip file

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT

#$CURL --user $CREDENTIALS $HOST$ENDPOINT > flow.zip

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


# ------ Commit and Push in Github
#git add …
#git commit -m "…"
#git push