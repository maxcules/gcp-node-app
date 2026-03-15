variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-north2"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "europe-north2-a"
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "app-cluster"
}

variable "network_name" {
  description = "Custom VPC name"
  type        = string
  default     = "app-vpc"
}

variable "subnet_name" {
  description = "Custom subnet name"
  type        = string
  default     = "app-subnet"
}

variable "subnet_cidr" {
  description = "Primary subnet CIDR"
  type        = string
  default     = "10.10.0.0/20"
}

variable "pods_secondary_range_name" {
  description = "Secondary range name for GKE pods"
  type        = string
  default     = "gke-pods-range"
}

variable "pods_secondary_cidr" {
  description = "Secondary CIDR for GKE pods"
  type        = string
  default     = "10.20.0.0/16"
}

variable "services_secondary_range_name" {
  description = "Secondary range name for GKE services"
  type        = string
  default     = "gke-services-range"
}

variable "services_secondary_cidr" {
  description = "Secondary CIDR for GKE services"
  type        = string
  default     = "10.30.0.0/20"
}

variable "machine_type" {
  description = "Machine type for Mongo VMs and GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "mongo_instances" {
  description = "MongoDB instance definitions"
  type = map(object({
    name       = string
    ip_address = string
  }))

  default = {
    mongo1 = {
      name       = "mongo-1"
      ip_address = "10.10.0.10"
    }
    mongo2 = {
      name       = "mongo-2"
      ip_address = "10.10.0.11"
    }
    mongo3 = {
      name       = "mongo-3"
      ip_address = "10.10.0.12"
    }
  }
}

variable "ssh_source_ranges" {
  description = "Your public IP CIDR(s) allowed to SSH to Mongo VMs"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}