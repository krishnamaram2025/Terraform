variable "myregion"{
type = "string"
default = "us-east-1"
}


variable "myamiid"{
type = "string"
#default = "ami-04e7101e25c6bc584"
}
variable "mykeypair"{
type = "string"
}
 
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "vpc_cidr_lbsubnet" {
  default = "192.168.10.0/24"
}
variable "vpc_cidr_appsubnet" {
  default = "192.168.20.0/24"
}
variable "azs" {
  type = "map"
  default = {
    us-east-1 = "us-east-1a,us-east-1b,us-east-1c,us-east-1d"
}
}
variable "rds_azs" {
  type = "map"
  default = {
    us-east-1 = "us-east-1e,us-east-1f"
}
}

variable "desired_azs_cnt" {
  default = 3 
}
variable "multi_az" {
  default = "false"
}
variable "enable_user_defined_ips" {
  description = "enable user defined appservers ips"
  default = false
}
variable "appserver_pa_ips" {
  type = list
  description = "internal ips to assign appserver nodes"
  default = [""]
}
variable "rds_mysql_db" {
type = "map"
}
#variable "mytags"{
#type = "map"
#default = {
#"fname" = "krishna"
#"lname" = "maram"
#}
#}

variable "fname"{
  default = "krishna"
  }
variable "lname"{
  default = "maram"
  }
