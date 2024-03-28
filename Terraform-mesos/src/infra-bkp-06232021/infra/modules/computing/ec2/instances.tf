################################################  Computing modules #####################################
resource "aws_eip" "lbeip"{
count = 2
instance = "${element(aws_instance.lbserver.*.id, count.index)}"
vpc = "true"
}


resource "aws_instance" "lbserver" {
count = 2
#availability_zone = "us-east-1c"
ami = "${var.myamiid}"
instance_type = "t2.medium"
subnet_id = "${var.publicsubnet1}"
#private_ip= "192.168.1.6"
vpc_security_group_ids = ["${var.websg}"]
key_name = "${var.mykeypair}"
user_data = "${element(var.user_data["lbserver"], count.index)}"
tags = "${merge(var.tags, map("Name", format("lb-server-%d", count.index + 1)))}"
root_block_device {
  volume_type = "standard"
  volume_size = "9"
  delete_on_termination = "true"
  }
ebs_block_device {
  device_name = "/dev/xvde"
  volume_type = "gp2"
  volume_size = "10"
  }
}

resource "aws_instance" "appserver" {
count = 2
#availability_zone = "us-east-1c"
ami = "${var.myamiid}"
instance_type = "t2.medium"
subnet_id = "${var.privatesubnet1}"
#private_ip= "192.168.3.6"
vpc_security_group_ids = ["${var.websg}"]
key_name = "${var.mykeypair}"
user_data = "${element(var.user_data["appserver"], count.index)}"
tags = "${merge(var.tags, map("Name", format("app-server-%d", count.index + 1)))}"
}
