variable "region"{
type = string
}
variable "lbserver"{
type = string
}
variable "appserver"{
type = string
}

variable "vpc_cidr" {
}

variable "vpc_cidr_lbsubnet" {
}
variable "vpc_cidr_appsubnet" {
}
variable "azs_lst" {
}
variable "azs_cnt" {
}
variable "desired_azs_cnt" { 

}
variable "enable_user_defined_ips" {
}
variable "appserver_pa_ips" {
  type = list
}

