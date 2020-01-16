
#!/bin/bash      
CURL='/usr/bin/curl'

# ------ EXPORT ENV --------

CREDENTIALS_EXPORT='login:password'
HOST_EXPORT='http://xxxx:3005'
#HOST='http://localhost:3005'

# ------ IMPORT ENV --------

CREDENTIALS_IMPORT='login:password'
HOST_IMPORT='http://xxxx:3005'

# --------------------------------------------------------------------
# We use jq, a lightweight and flexible command-line JSON processor
# For installation instructions https://stedolan.github.io/jq/

# Need also a flows folder under script location


# ------------- Get list of flows ---------------

ENDPOINT_GETALLFLOWS="/v4/flows?noLimit=true"
#ENDPOINT_GETALLFLOWS="/v4/flows?limit=2"

allflows=$( $CURL --user $CREDENTIALS_EXPORT $HOST_EXPORT$ENDPOINT_GETALLFLOWS)

#echo "${allflows}" | jq '.data|.[0]';

for row in $(echo "${allflows}" | tr '\r\n' ' ' | jq -r '.data|.[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }
    flow_id=$(_jq '.id')
    flow_name=$(_jq '.name')
    echo
    echo "Flow id "$flow_id" , Name : "$flow_name
	echo

# ------------- Export a flow (zip package) ---------------

	output_export=$( $CURL --user $CREDENTIALS_EXPORT $HOST_EXPORT/v4/flows/$flow_id/package -o flows/flow_$flow_id.zip)
	#echo $output_export

# ------------- Import a flow (zip package) ---------------

	output_import=$( $CURL --user $CREDENTIALS_IMPORT $HOST_IMPORT/v4/flows/package --header "Content-Type: multipart/form-data" --request POST -F data=@flows/flow_$flow_id.zip)
	#echo $output_import

# ------------- Get new flow id ---------------

    new_flow=$( $CURL --user $CREDENTIALS_IMPORT $HOST_IMPORT/v4/flows?limit=1)
    new_flow_id=$(echo "${new_flow}" | jq '.data|.[0].id');
	#echo $new_flow

# ------------- Update new flow name ---------------

    flow_update=$( $CURL --user $CREDENTIALS_IMPORT $HOST_IMPORT/v4/flows/$new_flow_id --header "Content-type: application/json" --request PATCH -d '{"name": "'"$flow_name"'"}')
	#echo $flow_update

done

echo
ls -ls ./flows

echo