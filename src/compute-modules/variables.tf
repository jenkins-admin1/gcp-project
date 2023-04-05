# variables.tf

variable "project_id" {
  type    = string
  description = "The ID of the GCP project"
}

variable "region" {
  type    = string
  description = "The GCP region to deploy resources in"
}

variable "network" {
  type    = string
  description = "The name of the GCP network to deploy resources in"
}

variable "subnet" {
  type    = string
  description = "The name of the GCP subnet to deploy resources in"
}

variable "domain_name" {
  type    = string
  description = "The name of the Active Directory domain"
  default = "markroofing.com"
}

variable "domain_username" {
  type    = string
  description = "The username for the Active Directory domain join"
}

variable "domain_password" {
  type    = string
  description = "The password for the Active Directory domain join"
}

variable "domain_ou_path" {
  type    = string
  description = "The ou-path for the Active Directory domain join"
  default = "OU=GCP,OU=DEV,OU=Servers,DC=markroofing,DC=com"
}

variable "vms" {
  type    = list(object({
    hostname       = string
    machine_type   = string
    disk_size_gb   = number
    disk_image     = string
    static_ip      = string
    startup_script = string
  }))
  description = "The list of VMs to deploy"
}
