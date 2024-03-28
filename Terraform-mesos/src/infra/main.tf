#########################################  Importing  modules #################################

module "computing"{
source = "./modules/computing/ec2"
websg = "${module.security.websg}"
lbsubnet = "${module.networking.lbsubnet}"
appsubnet = "${module.networking.appsubnet}"
#lbuserdata = "${module.cloudinit.lbuserdata}"
#appuserdata = "${module.cloudinit.lbuserdata}"
user_data = "${map("lbserver",module.cloudinit.lbuserdata, "appserver",module.cloudinit.appuserdata)}"
myamiid = "${var.myamiid}"
mykeypair = "${var.mykeypair}"
tags = "${module.tags.tags}"
}


module "networking"{
source = "./modules/networking/vpc"
region = "${var.myregion}"
lbserver = "${module.computing.lbserver}"
appserver = "${module.computing.appserver}"
vpc_cidr = "${var.vpc_cidr}"
vpc_cidr_lbsubnet = "${var.vpc_cidr_lbsubnet}"
vpc_cidr_appsubnet = "${var.vpc_cidr_appsubnet}"
azs_lst = "${lookup(var.azs, var.myregion)}"
azs_cnt = "${length(split(",",lookup(var.azs, var.myregion)))}"
desired_azs_cnt = "${var.desired_azs_cnt}"
enable_user_defined_ips = "${var.enable_user_defined_ips}"
appserver_pa_ips = "${var.appserver_pa_ips}"
}


module "security"{
source = "./modules/security/sg"
myvpc = "${module.networking.myvpc}"
}

module "dbms"{
source = "./modules/dbms/rds"
mydbsubnetgroup = "${module.networking.mydbsubnetgroup}"
websg = "${module.security.websg}"
rds_mysql_db = "${var.rds_mysql_db}"
}



module "cloudinit"{
source = "./modules/cloudinit"
}


module "tags"{
source = "./modules/tags"
fname = "${var.fname}"
lname = "${var.lname}"
}
