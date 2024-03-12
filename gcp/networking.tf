###################### VPC ####################
resource "google_compute_network" "myvpc" {
  name                    = "myvpc"
  auto_create_subnetworks = "false"
  mtu                     = 1460
}

####################### Subnets #################
resource "google_compute_subnetwork" "mysubnet" {
  name          = "mysubnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-west2"
  network       = google_compute_network.myvpc.id
}

################## Public IP Addresses #################
resource "google_compute_address" "runnerip" {
  name = "runnerip"
  region = "us-west2"
  depends_on = [ google_compute_firewall.myfw ]
 }

resource "google_compute_address" "masterip" {
  count = 1
  name = "masterip-${count.index + 1}"
  region = "us-west2"
  depends_on = [ google_compute_firewall.myfw ]
 }

resource "google_compute_address" "static" {
  count = 2
  name = "staticip-${count.index + 1}"
  region = "us-west2"
  depends_on = [ google_compute_firewall.myfw ]
 }

resource "google_compute_address" "bastionpip" {
  name = "bastionpip"
  region = "us-west2"
  depends_on = [ google_compute_firewall.myfw ]
}