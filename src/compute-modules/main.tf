locals {
  domain_username = var.domain_username
  domain_password = var.domain_password
  domain_name = var.domain_name
  domain_ou_path = var.domain_ou_path
  service_account_id = lower(format("%s-%s", var.app_short_name, random_string.service_account_id.result))

  labels_mandatory = {
    app_name = var.labels.app_name
    department_name = var.labels.department_name
    contact_name = var.labels.contact_name
    environment = var.labels.environment
  }
}

data "google_service_account" "compute_service_account" {
  account_id = "my-service-account-id"
  project    = var.project_id
}


# Create the VM instances
resource "google_compute_instance" "vm" {
  count = length(var.vms)

  name         = var.vms[count.index].hostname
  machine_type = var.vms[count.index].machine_type

  boot_disk {
    initialize_params {
      image = var.vms[count.index].disk_image
      size = var.vms[count.index].disk_size_gb
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnet
    access_config {
      nat_ip = var.vms[count.index].static_ip
    }
  }

  # Join the VM to the Active Directory domain
  metadata_startup_script = var.vms[count.index].startup_script
}

//random string for service account id
resource "random_string" "service_account_id" {
  length  = 4
  min_lower = 0
  min_numeric = 4
  min_special = 0
  min_upper = 0
  numeric = true
  lower = false
  upper = false
  special = false
}