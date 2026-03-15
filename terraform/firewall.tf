resource "google_compute_firewall" "allow_ssh_to_mongo" {
  name    = "allow-ssh-to-mongo"
  network = google_compute_network.vpc.name

  direction = "INGRESS"
  priority  = 1000

  target_tags = ["mongo"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_source_ranges
}

resource "google_compute_firewall" "allow_mongo_internal" {
  name    = "allow-mongo-internal"
  network = google_compute_network.vpc.name

  direction = "INGRESS"
  priority  = 1000

  target_tags = ["mongo"]

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  source_ranges = [
    var.subnet_cidr,
    var.pods_secondary_cidr,
    var.services_secondary_cidr
  ]
}

resource "google_compute_firewall" "allow_http_https_to_gke" {
  name    = "allow-http-https-to-gke"
  network = google_compute_network.vpc.name

  direction = "INGRESS"
  priority  = 1000

  target_tags = ["gke-node"]

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}