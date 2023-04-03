variable "environment" {
  description = "The environment name"
  type        = string
}

variable "folder_id" {
  type    = map(any)
  default = {
    "dev" = "285135843"
    "qa"  = "838855663572"
  }
}

variable "app_short_name" {
  description = "The short name of the application"
  type = string
}

variable "project_id" {
  description = "The prefix for the project ID, if not provided 'name' will be used"
  type = string
  default     = ""
}

variable "default_region" {
  type    = string
  default = "us-central1"
}

variable "activate_apis" {
  description = "The list of apis to be activated within the project"
  type = list(string)
  default     = ["compute.googleapis.com"]
}

variable "org_id" {
  description = "The ID of the organization in which to create the project"
}

variable "billing_account" {
  description = "The ID of the billing account to associate with the project"
}

variable "owner_email" {
  description = "The email address of the project owner"
}

variable "owner_group_email" {
  description = "The email address of the project owner group"
}

variable "labels" {
  description = "Labels to be attached to the project"
  type        = map(string)
  default     = {}
}
