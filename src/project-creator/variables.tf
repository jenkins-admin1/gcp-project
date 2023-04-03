variable "environment" {
  description = "The environment name"
  default     = "dev"
}

variable "app_short_name" {
  description = "The short name of the application"
  default     = "app1"
}

variable "project_name" {
  description = "The name of the project"
  default     = "${var.environment}-${var.app_short_name}"
}

variable "project_id_prefix" {
  description = "The prefix for the project ID"
  default     = "${var.environment}-${var.app_short_name}"
}

variable "organization_id" {
  description = "The ID of the organization in which to create the project"
}

variable "billing_account_id" {
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
