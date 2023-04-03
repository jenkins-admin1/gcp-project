variable "environment" {
  description = "The environment name = 'dev, qa'"
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

variable "default_region" {
  type    = string
  default = "us-central1"
}

variable "activate_apis" {
  description = "The list of additional apis to be activated within the project"
  type = list(string)
  default     = [""]
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
