output "lbuserdata" {
value = ["${data.template_file.lbserver-userdata.rendered}"]
}
output "appuserdata" {
value = ["${data.template_file.appserver-userdata.rendered}"]
}
