
output "ssh_to_master" {
  value = "ssh ubuntu@${aws_instance.master_node[0].public_ip}"
} 

output "ssh_to_worker-1" {
  value = "ssh ubuntu@${aws_instance.worker_node[0].public_ip}"
} 

output "ssh_to_worker-2" {
  value = "ssh ubuntu@${aws_instance.worker_node[1].public_ip}"
} 

output "ssh_to_runner" {
  value = "ssh ubuntu@${aws_instance.runner_node[0].public_ip}"
} 
