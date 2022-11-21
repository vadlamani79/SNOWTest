def call(String testName){
  
if ("${testName}" == "create")
     {
       sh """curl --location --request POST 'https://dev104644.service-now.com/api/sn_chg_rest/change/normal' --header 'Content-Type: application/json' --header 'Authorization: Basic YWRtaW46NnpxQE93QGUwSEND' --data-raw '{"short_description": "Test Desc 1233","assignment_group": "Database"}'"""
     }
  else if ("${testName}" == "update")
     {
       sh ""
     }
  else if ("${testName}" == "get")
     {
       sh """curl --location --request GET 'https://dev104644.service-now.com/api/sn_chg_rest/change/20de36ec73d423002728660c4cf6a7d6' --header 'Authorization: Basic YWRtaW46NnpxQE93QGUwSEND'"""
     }
}