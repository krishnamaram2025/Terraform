output "ssh_to_bastionhost-server" {
  value = "ssh ubuntu@${aws_instance.bastionhost_server[0].public_ip}"
} 

output "ssh_to_nginx-server" {
  value = "ssh ubuntu@${aws_instance.nginx_server[0].public_ip}"
} 

