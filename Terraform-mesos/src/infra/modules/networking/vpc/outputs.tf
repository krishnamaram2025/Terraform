output "myvpc" {
value = "${aws_vpc.myvpc.id}"
}
output "lbsubnet" {
value = "${aws_subnet.lbsubnet.*.id}"
}
output "appsubnet" {
value = "${aws_subnet.appsubnet.*.id}"
}
output "mydbsubnetgroup" {
value = "${aws_db_subnet_group.mydbsubnetgroup.id}"
}
#output "dbserver_publicip" {
#value = "${aws_instance.dbserver.public_ip}"
#}
