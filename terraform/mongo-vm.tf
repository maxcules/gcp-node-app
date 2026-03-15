resource "google_compute_instance" "mongo" {
  for_each = var.mongo_instances

  name         = each.value.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["mongo"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 20
      type  = "pd-standard"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    network_ip = each.value.ip_address

    access_config {}
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}