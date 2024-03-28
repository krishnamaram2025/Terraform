output "lbserver" {
value = "${aws_instance.lbserver[0].id}"
}
output "appserver" {
value = "${aws_instance.appserver[0].id}"
}
#output "appserver_publicip" {
#value = "${aws_instance.appserver.public_ip}"
#}
#output "dbserver_publicip" {
#value = "${aws_instance.dbserver.public_ip}"
#}
