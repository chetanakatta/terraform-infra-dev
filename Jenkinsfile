pipeline {

    agent {
        label 'AGENT-1' // our agent name
    }

    options {
        //after particular time job will be failed (timeout counter starts before agent is allocated)
        timeout (time: 30, unit: 'MINUTES')
        disableConcurrentBuilds () //disables multiple executions
    }

    stages {
        stage ('Init') {
            steps {
                sh """
                cd 01-vpc
                terraform init -reconfigure
                ls -ltr
                """
            }    
        }

        stage ('Plan') {
            steps {
                sh 'echo this is test'
                //sh 'sleep 10'
            }
        }

        stage ('deploy') {
            steps {
                sh 'echo this is deploy'
            }
        }
    }

    post { //useful as alert for success or failure
        always {
            echo 'I will always say hello'
        }
        success {
            echo 'I will run when pipeline is success'
        }
        failure {
            echo 'I will run when pipeline is failure'
            // we configure with slack, when failed we get messege
        }
    }
}