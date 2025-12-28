pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_DEFAULT_REGION    = "ap-south-1"
    }

    stages {

        stage('Checkout') {
            steps {
                dir("terraform") {
                    git branch: 'main',
                        url: 'https://github.com/rahulkumar0055/Terraform-Jenkins.git'
                }
            }
        }

        stage('Init') {
            steps {
                sh '''
                cd terraform
                terraform init
                '''
            }
        }

        stage('Destroy Approval') {
            steps {
                input message: "🔥 Confirm destroy all Terraform resources?"
            }
        }

        stage('Destroy') {
            steps {
                sh '''
                cd terraform
                terraform destroy -auto-approve
                '''
            }
        }
    }
}
