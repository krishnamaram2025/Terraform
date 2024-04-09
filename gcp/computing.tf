
######################### K8S Master nodes ##############
resource "google_compute_instance" "master_node" {
  count = var.master_count
  name         = "master-node-${count.index + 1}"
  machine_type = "e2-highcpu-8"
  zone         = "us-west2-a"
  boot_disk {
    initialize_params {
      // Disk size
      size  = "100"
      // Disk type               
      type  = "pd-ssd"
      // Image
      image = var.ubuntu_ami
    } 
  }
  network_interface {
    // Subnet attachment
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
       // Ephemeral public IP
       nat_ip = google_compute_address.masterip[count.index].address
     }
}
metadata = {
  ssh-keys ="${var.mysshuser}:${var.mykey}"
}
}
######################### K8S Worker nodes ##############
resource "google_compute_instance" "worker_node" {
  count = var.worker_count
  name         = "worker-node-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = "us-west2-a"
  boot_disk {
    initialize_params {
      // Disk size
      size  = "25"
      // Disk type               
      type  = "pd-ssd"
      // Image
      image = var.ubuntu_ami
    } 
  }
  network_interface {
    // Subnet attachment
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
       // Ephemeral public IP
       nat_ip = google_compute_address.static[count.index].address
     }
}
metadata = {
  ssh-keys ="${var.mysshuser}:${var.mykey}"
}
}

######################### Runner nodes ##############
resource "google_compute_instance" "runner_node" {
  count = var.runner_count
  name         = "runner-node-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = "us-west2-a"
  boot_disk {
    initialize_params {
      // Disk size
      size  = "25"
      // Disk type               
      type  = "pd-ssd"
      // Image
      image = var.ubuntu_ami
    } 
  }
  network_interface {
    // Subnet attachment
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
       // Ephemeral public IP
       nat_ip = google_compute_address.masterip[count.index].address
     }
}
metadata = {
  ssh-keys ="${var.mysshuser}:${var.mykey}"
}
}

######################### Jenkins nodes ##############
resource "google_compute_instance" "jenkins_node" {
  count = var.jenkins_count
  name         = "jenkins-node-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = "us-west2-a"
  boot_disk {
    initialize_params {
      // Disk size
      size  = "25"
      // Disk type               
      type  = "pd-ssd"
      // Image
      image = var.centos_ami
    } 
  }
  network_interface {
    // Subnet attachment
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
       // Ephemeral public IP
       nat_ip = google_compute_address.masterip[count.index].address
     }
}
metadata = {
  ssh-keys ="${var.mysshuser}:${var.mykey}"
}
}

######################### MySQL nodes ##############
resource "google_compute_instance" "mysql_node" {
  count = var.mysql_count
  name         = "mysql-node-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = "us-west2-a"
  boot_disk {
    initialize_params {
      // Disk size
      size  = "25"
      // Disk type               
      type  = "pd-ssd"
      // Image
      image = var.centos_ami
    } 
  }
  network_interface {
    // Subnet attachment
    subnetwork = google_compute_subnetwork.mysubnet.id
    access_config {
       // Ephemeral public IP
       nat_ip = google_compute_address.masterip[count.index].address
     }
}
metadata = {
  ssh-keys ="${var.mysshuser}:${var.mykey}"
}
}
