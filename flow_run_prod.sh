
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='deploy@trifacta.local:deploy'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")

echo

if [ -z "$1" ]
  then
    echo "Please call '$0 <deploy_id>' to run this command"
    echo
	exit 1
   else
    deploy_id=$1
fi

echo "Deployment ID : "$deploy_id
echo

# ------------- Run active flow from a deployment project ---------------


# Deploy a flow package
ENDPOINT="/v4/deployments/$deploy_id/run"
# POST

#curl -X POST http://example.com:3005/v4/deployments/3/run

#Request Body - Example for dataset with parameters: 
#{
#  "overrides": {
#    "runParameters": {
#      "overrides": {
#        "data": [{
#          "key": "varRegion",
#          "value": "02"
#        }
#]} }
#} }

contrats="Contrats_Prod"

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --request POST  -H "Content-type: application/json" -d '{"runParameters": {"overrides": {"data": [{"key": "Fichier_Contrats","value": "'"$contrats"'"}]} }}'
echo

output=$( $CURL --user  $CREDENTIALS $HOST$ENDPOINT -X POST -H "Content-type: application/json"  -d '{"runParameters": {"overrides": {"data": [{"key": "Fichier_Contrats","value": "'"$contrats"'"}]} }}')
echo
echo "Run result => $output"
echo