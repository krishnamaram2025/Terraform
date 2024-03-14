#################### Firewalls ##############
resource "google_compute_firewall" "myfw" {
  name    = "myfw"
  network = google_compute_network.myvpc.name
  # Allow specific ports
  #allow {
  #  protocol = "tcp"
  #  ports    = ["22","80","443", "8000"]
 # }
  # Allow all traffic
    # Allow specific ports
  allow {
    protocol = "all"
  }
source_ranges = ["0.0.0.0/0"]
}