################################################  Cloud init module  ####################################
provider "template"{

}
data "template_file" "lbserver-userdata" {
  template = "${file("${path.module}/userdata.tpl")}"

  vars = {
   vm_role = "lbserver"
  }
}
data "template_file" "appserver-userdata" {
  template = "${file("${path.module}/userdata.tpl")}"

  vars = {
   vm_role = "appserver"
  }
}
