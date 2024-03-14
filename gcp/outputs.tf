output "master_node1_public_ip" {
   value = "ssh gcp-user@${google_compute_instance.master_node[0].network_interface.0.access_config.0.nat_ip}"
 }
 
#output "worker_node1_public_ip" {
#   value = "ssh gcp-user@${google_compute_instance.worker_node[0].network_interface.0.access_config.0.nat_ip}"
# }

# output "worker_node2_public_ip" {
#   value = "ssh gcp-user@${google_compute_instance.worker_node[1].network_interface.0.access_config.0.nat_ip}"
# }

#output "runner_node_public_ip" {
#   value = "ssh gcp-user@${google_compute_instance.runner_node[0].network_interface.0.access_config.0.nat_ip}"
# }

#output "jenkins_server_public_ip" {
#  value = "ssh gcp-user@${google_compute_instance.jenkins_server[0].network_interface.0.access_config.0.nat_ip}"
#}

#output "mysql_node_public_ip" {
#   value = "ssh gcp-user@${google_compute_instance.mysql_node[0].network_interface.0.access_config.0.nat_ip}"
# }
