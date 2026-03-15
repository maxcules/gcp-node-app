output "gke_get_credentials_command" {
  description = "Command to configure kubectl context for this cluster"
  value       = "gcloud container clusters get-credentials ${google_container_cluster.gke.name} --location ${google_container_cluster.gke.location} --project ${var.project_id}"
}

output "mongo_private_ips" {
  description = "Private IPs of MongoDB VMs"
  value = {
    for k, vm in google_compute_instance.mongo :
    k => vm.network_interface[0].network_ip
  }
}
