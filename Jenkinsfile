pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = 'AKIA5RMP7GWQPBMEY4XG'
        AWS_SECRET_KEY_ID = credentials('aws-secret-key')
        AWS_DEFAULT_REGION = 'eu-central-1'
    }
    stages {
        stage("Initialization") {
            steps{
                sh 'terraform init'
            }
        }
        stage("Plan") {
            steps{
                sh 'terraform plan'
            }
        }
        stage("Apply") {
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
