//defining the source module for the terragrunt file
terraform {
  source = "../../../../..//src//shared-vpc"
}

# Set input variables for the shared VPC module
inputs = {
  project_id           = "prj-dev-app1-1729"
  vpc_name             = "my-shared-vpc"
  subnet_name          = "subnet-1"
  subnet_ip_cidr_range = "172.10.0.0/24"
  peering_name         = "my-peering"
  peer_network_name    = "projects/peer-project-id/global/networks/peer-network-name"
}
