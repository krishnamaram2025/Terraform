#########################################  Importing  modules #################################

module "computing"{
source = "./modules/computing/ec2"
websg = "${module.security.websg}"
publicsubnet1 = "${module.networking.publicsubnet1}"
privatesubnet1 = "${module.networking.privatesubnet1}"
#lbuserdata = "${module.cloudinit.lbuserdata}"
#appuserdata = "${module.cloudinit.lbuserdata}"
user_data = "${map("lbserver",module.cloudinit.lbuserdata, "appserver",module.cloudinit.appuserdata)}"
myamiid = "${var.myamiid}"
mykeypair = "${var.mykeypair}"
tags = "${module.tags.tags}"
}


module "networking"{
source = "./modules/networking/vpc"
lbserver = "${module.computing.lbserver}"
appserver = "${module.computing.appserver}"
}


module "security"{
source = "./modules/security/sg"
myvpc = "${module.networking.myvpc}"
}

module "dbms"{
source = "./modules/dbms/rds"
mydbsubnetgroup = "${module.networking.mydbsubnetgroup}"
websg = "${module.security.websg}"
}



module "cloudinit"{
source = "./modules/cloudinit"
}


module "tags"{
source = "./modules/tags"
fname = "${var.fname}"
lname = "${var.lname}"
}
