# Title
This project is intended to provision AWS infrastructure.

# Pre-Requisites
* Step 1: Download and intsall terraform tool
```
https://developer.hashicorp.com/terraform/downloads
```
* Step 2: Athentication to AWS
```
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
```

# Execution Flow
* Step 1: Clone the repository
```
git clone https://github.com/krishnamaram2025/Terraform.git && cd Terraform/aws
```
* Step 2: Customize config
```
vi config.json
centos us-east-1: ami-002070d43b0a4f171
ubuntu us-east-1: ami-053b0d53c279acc90
```
* Step 3: To initialize a terraform directory
```
terraform init
terraform validate -var-file config.json
terraform apply -var-file config.json
```