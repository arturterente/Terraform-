pipeline {
    agent any
    stages {
        stage("Initialization") {
            steps{
                terraform init
            }
        }
        stage("Plan") {
            steps{
                terraform plan
            }
        }
        stage("Apply") {
            steps{
                terraform apply
            }
        }
    }
}
