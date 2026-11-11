pipeline {
    agent any
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
                sh 'terraform apply'
            }
        }
    }
}
