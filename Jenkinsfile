pipeline {

    agent {
        label 'AGENT-1' // our agent name
    }

    options {
        //after particular time job will be failed (timeout counter starts before agent is allocated)
        timeout (time: 30, unit: 'MINUTES')
        disableConcurrentBuilds () //disables multiple executions
        ansiColor('xterm')
    }

    parameters {
        choice( name: 'action', choices: ['Apply', 'Destroy'], description: 'pick something')
    }

    stages {
        stage ('Init') {
            steps {    //every stage in root directory, we have to give cd for every stage
                sh """
                cd 01-vpc
                terraform init -reconfigure 
                ls -ltr
                """
            }    
        }

        stage ('Plan') {

            when {    //for decisions we use when condition
                expression {
                    params.action == 'Apply'
                }
            }

            steps {
                sh """
                cd 01-vpc    
                terraform plan
                """
            }
        }

        stage ('deploy') {

            when {    //for decisions we use when condition

                expression {
                    params.action == 'Apply'
                }

            }

            input {

                message "should we continue?"
                ok "yes, we should"  //if we press yes then only next step will continue

            }
            steps {

                sh """
                cd 01-vpc
                terraform apply -auto-approve
                """
            }
        }

        stage ('destroy') {

            when {    //for decisions we use when condition

                expression {
                    params.action == 'Destroy'
                }
                
            }

            steps {

                sh """
                cd 01-vpc
                terraform destroy -auto-approve
                """
            }
        }
    }

    post { //useful as alert for success or failure

        always {
            echo 'I will always say hello'
            deleteDir()    //to delete workspace after build
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