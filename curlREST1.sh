#!/bin/bash


#get the oauth2 response and store it (create your own connected app to get a new client id and secret - https://na1.salesforce.com/help/pdfs/en/salesforce_identity_implementation_guide.pdf)
response=`curl --request  POST 'https://dev98791.service-now.com/oauth_token.do' --data-urlencode 'grant_type=password' --data-urlencode 'client_id=048252f182f51110fb36a793e2296d54' --data-urlencode 'client_secret=[^rJmzG+(U' --data-urlencode 'username=admin' --data-urlencode 'password=qcowR1-UC%G7'`

#uncomment to check response json
echo "response: {$response}"

#test regular expression for an access token
pattern='"access_token":"([^"]*)"'
if [[ $response =~ $pattern ]]; then
	
	#use some BASH_REMATCH magic to pull the access token substring out and store it - see http://robots.thoughtbot.com/the-unix-shells-humble-if for examples
	access_token="${BASH_REMATCH[1]}"
	
	#uncomment to check token results
	echo "token: ${access_token}"

	#now run whatever REST API query, insert, delete, etc... you want
	curl https://dev98791.service-now.com/api/now/table/x_877231_to_do_api_table -H "Authorization: Bearer ${access_token}" -H "X-PrettyPrint:1" 
else
	#whoops - what happened?
	echo "something went terribly wrong :("
fi
