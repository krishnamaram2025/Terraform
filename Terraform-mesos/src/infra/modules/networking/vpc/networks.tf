############### VPC Creation ##############
resource "aws_vpc" "myvpc"{
cidr_block = "${var.vpc_cidr}"
tags ={
Name = "myvpc"
}
}

resource "aws_internet_gateway" "myigw"{
vpc_id = "${aws_vpc.myvpc.id}"
tags={
Name = "myigw"
}
}

resource "aws_nat_gateway" "myngw" {
  count = "${var.azs_cnt}"
  allocation_id = "${element(aws_eip.ngweip.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.lbsubnet.*.id, count.index)}"
  tags = {
    Name = "myngw"
  }
}

resource "aws_eip" "ngweip"{
count = "${var.azs_cnt}"
vpc = true
}
############################################ Public Subnets ###############################3
resource "aws_subnet" "lbsubnet"{
count = "${var.azs_cnt}"
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "${cidrsubnet(var.vpc_cidr_lbsubnet, 2, count.index)}"
availability_zone = "${element(split(",", var.azs_lst), count.index)}"
tags={
Name = "lbsubnet"
}
}

resource "aws_route_table" "publicrtb"{
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "publicrtb"
}
}

resource "aws_route" "publicrt"{
route_table_id = "${aws_route_table.publicrtb.id}"
destination_cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.myigw.id}"
}
 
#resource "aws_route_table_association" "publicrtba1"{
#route_table_id = "${aws_route_table.publicrtb1.id}"
#subnet_id = "${aws_subnet.publicsubnet1.id}"
#}

############################################ Private Subnets ###############################3


resource "aws_subnet" "appsubnet"{
count = "${var.enable_user_defined_ips ? var.desired_azs_cnt : var.azs_cnt}"
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "${cidrsubnet(var.vpc_cidr_appsubnet, 2, count.index)}"
availability_zone = "${element(split(",", var.azs_lst), count.index)}"
tags={
Name = "appsubnet"
}
}

resource "aws_route_table" "privatertb"{
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "privatertb"
}
}

resource "aws_route" "privatert"{
count = "${var.azs_cnt}"
route_table_id = "${element(aws_route_table.privatertb.*.id, count.index)}"
destination_cidr_block = "0.0.0.0/0"
nat_gateway_id = "${element(aws_nat_gateway.myngw.*.id, count.index)}"
}

resource "aws_route" "route_mainrtb"{
route_table_id = "${aws_vpc.myvpc.main_route_table_id}"
destination_cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.myigw.id}"
}


####################################### AWS RDS DB subnet group ##############################


resource "aws_subnet" "rds_subnet" {
  count = 2
  vpc_id       = "${aws_vpc.myvpc.id}"
  cidr_block = "192.168.${var.rds_base_subnet+count.index}.0/24"
  availability_zone = "${element(split(",",var.azs_lst), count.index)}"
  tags = {
    Name = "rdssubnet"
  }
}
resource "aws_db_subnet_group" "mydbsubnetgroup" {
  name       = "mydbsubnetgroup"
  subnet_ids = "${aws_subnet.rds_subnet.*.id}"

  tags = {
    Name = "My DB subnet group"
  }
}

variable "rds_base_subnet" {
  default = 30
  description = " base number to be used in the unique CIDR block"
}
