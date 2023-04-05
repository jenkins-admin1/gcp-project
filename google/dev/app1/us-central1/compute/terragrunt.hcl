
terraform {
  source = "../../../../..//src//compute-modules"
}

inputs = {
  project_id        = "your-project-id"
  region            = "us-central1"
  network           = "your-network"
  subnet            = "your-subnet"
  domain_name       = "your-domain-name"
  domain_username   = "your-domain-username"
  domain_password   = "your-domain-password"

  vms = [
    {
      hostname = "vm1"
      machine_type = "n1-standard-2"
      disk_size_gb = 30
      disk_image = "your-disk-image"
      static_ip = "10.0.0.2"
      startup_script = <<SCRIPT
        # Your startup script for VM1 goes here
      SCRIPT
    },
    {
      hostname = "vm2"
      machine_type = "n1-standard-4"
      disk_size_gb = 50
      disk_image = "your-disk-image"
      static_ip = "10.0.0.3"
      startup_script = <<SCRIPT
        # Your startup script for VM2 goes here
      SCRIPT
    },
    # Add additional VMs here as needed
  ]
}
