# Create a VPC network
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = "false"
}

# Create a firewall rule to allow all ingress traffic within the VPC
resource "google_compute_firewall" "vpc_firewall" {
  name    = "vpc-firewall"
  network = google_compute_network.vpc_network.name

  # Allow RDP (TCP port 3389) and SSH (TCP port 22) traffic
  allow {
    protocol = "tcp"
    ports    = ["3389", "22"]
  }

  # Allow WinRM (TCP ports 5985 and 5986) traffic from instances with 'winrm' network tag
  allow {
    protocol = "tcp"
    ports    = ["5985", "5986"]
    source_tags = ["winrm"]
  }

  # Allow ICMP traffic for ping
  allow {
    protocol = "icmp"
  }
}

# Create a subnet in the VPC
resource "google_compute_subnetwork" "vpc_subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_ip_cidr_range
  network                  = google_compute_network.vpc_network.name
  region                   = "us-central1"
  private_ip_google_access = "true"
}

# Create a VPC Peering connection to the shared VPC
resource "google_compute_network_peering" "vpc_peering" {
  name                    = var.peering_name
  auto_create_routes      = "false"
  peer_network            = var.peer_network_name
  network                 = google_compute_network.vpc_network.name
  exchange_subnet_routes = "true"
  export_custom_routes    = "false"
  import_custom_routes    = "false"
}

# Output the network name and subnet name for reference
output "network_name" {
  value = google_compute_network.vpc_network.name
}

output "subnet_name" {
  value = google_compute_subnetwork.vpc_subnet.name
}
