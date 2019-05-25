
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='deploy@trifacta.local:deploy'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")

echo

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

#-------------- FileLocation -----------------

ENDPOINT="/v4/deployments/$deploy_id/valueImportRules"
# PATCH : Json array object with mappings
# [ {
#     "type": "fileLocation",
#     "on": "//developpement//",
#     "with": "/production/"
# } ]

#[ {"type": "fileLocation","on": "//developpement//","with": "/production/"} ]

echo
echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --request PATCH
echo
output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT -X PATCH -H "Content-type: application/json" -d '[ {"type": "fileLocation","on": "//developpement//","with": "/production/"} ]')
echo
echo "Import File Locatiopn Rules result => $output"

#------------------- Connections -----------------

ENDPOINT="/v4/deployments/$deploy_id/objectImportRules"

#[{"tableName":"connections","onCondition":{"uuid":"2d7c1650-7daa-11e9-b9eb-0fd11bed75ab"},"withCondition":{"id":11}}]

echo
echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --request PATCH
echo
output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT -X PATCH -H "Content-type: application/json" -d '[{"tableName":"connections","onCondition":{"uuid":"2d7c1650-7daa-11e9-b9eb-0fd11bed75ab"},"withCondition":{"id":11}}]')
echo
echo "Import Connections Rules result => $output"

echo