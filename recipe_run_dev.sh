#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='admin@trifacta.local:admin'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")

echo

if [ -z "$1" ]
  then
    echo "\nPlease call '$0 <recipe_id>' to run this command\n"
	exit 1
   else
    recipe_id=$1
fi

echo
echo "Recipe ID : "$recipe_id
echo

# ------------- Run a recipe ---------------

# Run a recipe
ENDPOINT="/v4/jobGroups"

#{  "wrangledDataset": {"id": 114 }, "overrides": { "execution": "photon", "profiler": false,"writesettings": [{"path":"data/outputs/customer_output.csv", "action": "create","format": "csv"} ]}"runParameters": {"overrides": {"data": [{"key": "filename","value": "customer_1.csv"}]} }}

input_file="customer_1.csv"
output_file="customer_output_1.csv"

echo $CURL --user $CREDENTIALS $HOST$ENDPOINT --request POST
echo

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT -i -X POST -H "Content-type: application/json" -d '{  "wrangledDataset": {"id": '"$recipe_id"' }, "overrides": {"writesettings": [{"path":"hdfs://localhost:50070/data/outputs/'"$output_file"'", "action": "create","format": "csv"} ]},"runParameters": {"overrides": {"data": [{"key": "filename","value": "'"$input_file"'"}]} }}')
echo
echo "Run result => $output"
echo