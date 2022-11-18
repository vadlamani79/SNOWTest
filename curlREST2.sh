#!/bin/bash


#get the oauth2 response and store it (create your own connected app to get a new client id and secret - https://na1.salesforce.com/help/pdfs/en/salesforce_identity_implementation_guide.pdf)
response=`curl --location --request GET 'https://dev104644.service-now.com/api/sn_chg_rest/change/20de36ec73d423002728660c4cf6a7d6' --header 'Authorization: Basic YWRtaW46NnpxQE93QGUwSEND'`

#uncomment to check response json
echo "response: {$response}"

#test regular expression for an access token
#TOKEN=`echo $response | grep -Po `(?<="phase_state": ")[^"]*`
STAT="open"
if [ $STAT == 'open' ]
    then
echo "$STAT"
        exit 1
    fi

echo "$TOKEN" # Use for further processsing

