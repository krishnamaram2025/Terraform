# Project Title
This project is intended to provision infrastructure on Azure.
# Pre-Requisites
* Step 1: Download terraform utility
```
https://www.terraform.io/downloads -> unzip file -> terraform.exe
```
* Step 2: Edit the system environment variables
```
System variables -> click on Path -> enter terraform.exe file path -> New -> Ok 
```
* Step 3: Authentication to Azure
```
Service principal creation=>Azure active directory => App registrations => New registration -> Name : mysp(any name we can give) -> Register -> Certificates & secrets -> Client secrets -> New client secret -> Add -> copy client secret value
```
```
Assiging Permission for the above service princiap mysp to create resources in Azure => Subscription => IAM => Add -> add role assignment -> Role => Privileged administrator roles=> contributor -> members -> select members => select: <<mysp>> => click on Review + assign
```
```
export ARM_TENANT_ID="" && export ARM_SUBSCRIPTION_ID="" && export ARM_CLIENT_ID="" && export ARM_CLIENT_SECRET=""
```
# Execution Flow

* Step 1: clone repo
```
git clone https://github.com/krishnamaram2025/Terraform.git && cd Terraform/azure
```
* Step 2: Modify cluster config as per requirement in config.json
```
vi config.json
ssh-keygen
cat ~/.ssh/id_rsa.pub
```
* Step 3:  Uncomment required nodes
```
vi output.tf 
```
* Step 4: Provision infra
```
terraform init
```
```
terraform apply --var-file=config.json
```
* Step 5: Connectivity
```
ssh azure-user@PUBLIC_IP
sudo su -l
```