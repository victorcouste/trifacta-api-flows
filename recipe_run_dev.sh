#!/bin/bash      
CURL='/usr/bin/curl'
CREDENTIALS='admin@trifacta.local:admin'
HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")

# ------------- Run a recipe in dev env ---------------

recipe_id=114

# Run a recipe
ENDPOINT="/v4/jobGroups"

#{  "wrangledDataset": {"id": 114 }, "overrides": { "execution": "photon", "profiler": false,"writesettings": [{"path":"data/outputs/customer_output.csv", "action": "create","format": "csv"} ]}"runParameters": {"overrides": {"data": [{"key": "filename","value": "customer_1.csv"}]} }}

input_file="customer_1.csv"
output_file="customer_output_1.csv"

response=$( curl $CREDENTIALS $HOST$ENDPOINT -i -X POST -H "Content-type: application/json" -d '{  "wrangledDataset": {"id": '"$recipe_id"' }, "overrides": {"writesettings": [{"path":"hdfs://localhost:50070/data/outputs/'"$output_file"'", "action": "create","format": "csv"} ]},"runParameters": {"overrides": {"data": [{"key": "filename","value": "'"$input_file"'"}]} }}')

echo $response
