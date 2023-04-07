variable "project_id" {
  description = "The ID of the GCP project"
}

variable "vpc_name" {
  description = "The name of the VPC network"
}

variable "subnet_name" {
  description = "The name of the subnet"
}

variable "subnet_ip_cidr_range" {
  description = "The IP CIDR range for the subnet"
}

variable "peering_name" {
  description = "The name of the VPC peering connection"
}

variable "peer_network_name" {
  description = "The name of the peer network for VPC peering"
}
