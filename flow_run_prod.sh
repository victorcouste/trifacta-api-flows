
#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='deploy@trifacta.local:deploy'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")


# ------------- Run active flow from a deployment project ---------------

if [ -z "$1" ]
  then
    echo "\nPlease call '$0 <deploy_id>' to run this command\n"
	exit 1
   else
    deploy_id=$1
fi

echo
echo "Deployment ID : "$deploy_id

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

input_file="customer_1.csv"
output_file="customer_output_1.csv"

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --request POST

#output=$( $CURL --user  $CREDENTIALS $HOST$ENDPOINT -i -X POST -H "Content-type: application/json" -d '{"overrides": {"writesettings": [{"path":"hdfs://localhost:50070/data/outputs/'"$output_file"'", "action": "create","format": "csv"} ]},"runParameters": {"overrides": {"data": [{"key": "filename","value": "'"$input_file"'"}]} }}')

output=$( $CURL --user  $CREDENTIALS $HOST$ENDPOINT -X POST -H "Content-type: application/json")

echo "Run result => $output"