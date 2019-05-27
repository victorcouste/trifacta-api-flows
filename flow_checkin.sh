
#!/bin/bash
CURL='/usr/bin/curl'
CREDENTIALS='victor@trifacta.local:victor'
HOST='http://dev_env_server:3005'
#HOST='http://localhost:3005'

time=$(date +"%d-%m-%y %T")

echo

if (( $# < 4 ));
	then
		echo "Please call '$0 -f <flow_id> -t <tag_version>' to run this command"
		echo
		exit 1
   else

		while getopts f:t: option
		do 
 			case "${option}" 
 			in 
 			f) flow_id=${OPTARG};; 
 			t) tag_version=${OPTARG};; 
 			esac 
		done
	fi

echo "Flow ID : "$flow_id
echo "Tag : "$tag_version


# ------------- Export a flow (zip package) ---------------

ENDPOINT="/v4/flows/$flow_id/package"
# GET : result is a zip file

echo
echo $CURL --user $CREDENTIALS $HOST$ENDPOINT -o flows/flow_$flow_id.zip
echo

output=$( $CURL --user $CREDENTIALS $HOST$ENDPOINT -o flows/flow_$flow_id.zip)

echo
ls -ls ./flows/flow_$flow_id.zip

# -------------  Commit and Push in Github  ---------------

git add flows/flow_$flow_id.zip
echo
git commit -m "$tag_version - $time"
echo
git push
echo