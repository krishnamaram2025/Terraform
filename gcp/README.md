Project Title
=====================
This project is intended to provision infrastructure on GCP.

Pre-Requisites
============================
* Step 1: Download terraform utility
```
https://www.terraform.io/downloads -> unzip file -> terraform.exe
```
* Step 2: Edit the system environment variables
```
System variables -> click on Path -> enter terraform.exe file path -> New -> Ok 
```
* Step 3: Authentication to GCP
 ```
Service account creation=> IAM -> Service accounts -> create service account -> service account name : mysa -> click on CREATE AND CONTINUE ->  select a role -> Basic : owner -> continue -> done -> click on service account -> keys -> add key
```
```
Create project=>(till now I am unable to create project using terraform due to permission issue)
```
```
Permission to authenticate GCP APIs => APIs & Services: enabled APIs & Services => click on ENABLE APIS AND SERVICES => Compute Engine API and Cloud SQL Admin API
```
```
export GOOGLE_APPLICATION_CREDENTIALS=~/Downloads/gcp_cred.json
```
# Execution Flow

* Step 1: clone repo
```
git clone https://github.com/krishnamaram2025/Terraform.git && cd Terraform/gcp
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
ssh gcp-user@PUBLIC_IP
sudo su -l
```
