####################################### AWS RDS DB subnet group ##############################
resource "aws_db_subnet_group" "mydbsubnetgroup" {
  name       = "mydbsubnetgroup"
  subnet_ids = [aws_subnet.privatesubnet1.id, aws_subnet.privatesubnet2.id]

  tags = {
    Name = "My DB subnet group"
  }
}





#resource "aws_eip" "lbeip"{
#count = 2
#instance = "${var.lbserver}"
#}
#resource "aws_eip" "dbeip"{
#instance = "${var.dbserver}"
#}

resource "aws_eip" "ngweip"{
}
resource "aws_vpc" "myvpc"{
cidr_block = "192.168.0.0/16"
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


############################################ Public Subnets ###############################3
resource "aws_subnet" "publicsubnet1"{
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "192.168.1.0/24"
tags={
Name = "publicsubnet1"
}
}

resource "aws_route_table" "publicrtb1"{
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "publicrtb1"
}
}

resource "aws_route" "publicrt1"{
route_table_id = "${aws_route_table.publicrtb1.id}"
destination_cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.myigw.id}"
}
 
resource "aws_route_table_association" "publicrtba1"{
route_table_id = "${aws_route_table.publicrtb1.id}"
subnet_id = "${aws_subnet.publicsubnet1.id}"
}


resource "aws_subnet" "publicsubnet2"{
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "192.168.2.0/24"
tags={
Name = "publicsubnet2"
}
}

resource "aws_route_table" "publicrtb2"{
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "publicrtb2"
}
}

resource "aws_route" "publicrt2"{
route_table_id = "${aws_route_table.publicrtb2.id}"
destination_cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.myigw.id}"
}
 
resource "aws_route_table_association" "publicrtba2"{
route_table_id = "${aws_route_table.publicrtb2.id}"
subnet_id = "${aws_subnet.publicsubnet2.id}"
}
############################################ Private Subnets ###############################3


resource "aws_nat_gateway" "myngw" {
  allocation_id = aws_eip.ngweip.id
  subnet_id     = aws_subnet.publicsubnet1.id
  tags = {
    Name = "myngw"
  }
}

resource "aws_subnet" "privatesubnet1"{
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "192.168.3.0/24"
availability_zone = "us-east-1c"
tags={
Name = "privatesubnet1"
}
}

resource "aws_route_table" "privatertb1"{
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "privatertb1"
}
}

resource "aws_route" "privatert1"{
route_table_id = "${aws_route_table.privatertb1.id}"
destination_cidr_block = "0.0.0.0/0"
nat_gateway_id = "${aws_nat_gateway.myngw.id}"
}
resource "aws_route_table_association" "privatertba1"{
route_table_id = "${aws_route_table.privatertb1.id}"
subnet_id = "${aws_subnet.privatesubnet1.id}"
}

resource "aws_subnet" "privatesubnet2"{
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "192.168.4.0/24"
availability_zone = "us-east-1d"
tags={
Name = "privatesubnet2"
}
}

resource "aws_route_table" "privatertb2"{
vpc_id = "${aws_vpc.myvpc.id}"
tags = {
Name = "privatertb2"
}
}

resource "aws_route" "privatert2"{
route_table_id = "${aws_route_table.privatertb2.id}"
destination_cidr_block = "0.0.0.0/0"
nat_gateway_id = "${aws_nat_gateway.myngw.id}"
}
resource "aws_route_table_association" "privatertba2"{
route_table_id = "${aws_route_table.privatertb2.id}"
subnet_id = "${aws_subnet.privatesubnet2.id}"
}
