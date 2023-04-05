locals {
  domain_username = var.domain_username
  domain_password = var.domain_password
  domain_name = var.domain_name
  domain_ou_path = var.domain_ou_path
  
  labels_mandatory = {
    app_name = var.labels.app_name
    department_name = var.labels.department_name
    contact_name = var.labels.contact_name
    environment = var.labels.environment
  }
}

data "google_service_accounts" "my_service_accounts" {
  project = var.project_id
}

data "google_service_account" "my_service_account" {
  count = length(data.google_service_accounts.my_service_accounts.service_accounts)

  account_id = data.google_service_accounts.my_service_accounts.service_accounts[count.index].unique_id
  project    = var.project_id

  filter {
    display_name = "compute-sa"
  }
}

data "google_project" "project" {
  project = var.project_id
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