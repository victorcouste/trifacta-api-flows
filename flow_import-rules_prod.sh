
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='deploy@trifacta.local:deploy'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")


# ------------- Define Deployments Value/Object Import Rules ---------------

if [ -z "$1" ]
  then
    echo "\nPlease call '$0 <deploy_id>' to run this command\n"
	exit 1
   else
    deploy_id=$1
fi

echo
echo "Deployment ID : "$deploy_id

ENDPOINT="/v4/deployments/$deploy_id/valueImportRules"
# PATCH : Json array object with mappings
# [ {
#     "type": "fileLocation",
#     "on": "//developpement//data//",
#     "with": "/production/data/"
# } ]

#[ {"type": "fileLocation","on": "//dev//","with": "/prod/"} ]

echo
echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --request PATCH
echo

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT -X PATCH -H "Content-type: application/json" -d '[ {"type": "fileLocation","on": "//dev//","with": "/production/data/"} ]')

echo
echo "New Import Rules result => $output"


# ----------- Check all Import Rules --------------

echo
echo $CURL --user $CREDENTIALS $HOST$ENDPOINT
echo
output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT)
echo
echo "Import Rules => $output"
echo