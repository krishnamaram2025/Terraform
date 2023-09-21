pipeline {
  agent any

  stages {
      stage('Clone terraform repo') {
          steps {
              // clone terraform repo
              git 'https://github.com/devopsby2023/terraform.git'
          }
      }

      stage('Terraform Init') {
          steps {
              // Initialize Terraform
              sh 'terraform init'
          }
      }

      stage('Terraform Plan') {
          steps {
              // Run Terraform plan
              sh 'terraform plan -var-file dev_cluster.json'
          }
      }

      stage('Terraform Apply') {
          steps {
              // Apply Terraform changes
              sh 'terraform apply --auto-approve -var-file dev_cluster.json'
          }
      }
  }
}
