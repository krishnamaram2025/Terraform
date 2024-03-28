output "myvpc" {
value = "${aws_vpc.myvpc.id}"
}
output "publicsubnet1" {
value = "${aws_subnet.publicsubnet1.id}"
}
output "privatesubnet1" {
value = "${aws_subnet.privatesubnet1.id}"
}
output "mydbsubnetgroup" {
value = "${aws_db_subnet_group.mydbsubnetgroup.id}"
}
#output "dbserver_publicip" {
#value = "${aws_instance.dbserver.public_ip}"
#}
