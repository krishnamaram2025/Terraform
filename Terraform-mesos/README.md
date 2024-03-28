Project Title
=====================
Terraform is used to provision and manage IT Infrastructure

Pre-Requisites
============================



Execution Flow
=====================

$git clone https://github.com/cloudstones/mesos-terraform.git

$cd mesos-terraform/src

$source ../resources/export_keys.sh

$sh csp.sh -c kris create

$sh csp.sh -c kris apply

$sh csp.sh -c kris destroy

$sh csp.sh -c kris cleanup







$git clone https://github.com/cloudstones/mesos-terraform.git

$cd mesos-terraform

$python resources/generate_token.py

$source resources/export_keys.sh

$vi src/clusters/aws/dev.json

{

"myamiid" : "",
  
"mykeypair" : ""

}

$terraform init src/providers/aws

$terraform validate -var-file=src/clusters/aws/dev.json src/providers/aws

$terraform apply -var-file=src/clusters/aws/dev.json src/providers/aws
