pipeline {
    agent any
    parameters{ 
    string(name: 'var1', defaultValue: '123' , description: '', trim: true)
    }

    stages {
        stage ('checkout'){
            steps {
                git branch: 'main',url: 'https://github.com/vadlamani79/SNOWTest.git'
            }
        }
        stage('Sample') {
            steps {
                script{
                    echo "Test"
                    env.var1="Test123"
                    sh './curlREST2.sh'
                    sh """curl --location --request GET 'https://dev104644.service-now.com/api/sn_chg_rest/change/20de36ec73d423002728660c4cf6a7d6' --header 'Authorization: Basic YWRtaW46NnpxQE93QGUwSEND'
                    """
                }
                
            }
        }
        stage ('sample2'){
            steps{
                script {
                      echo env.var1
                }
                
            }
        }
    }
}