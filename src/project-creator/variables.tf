variable "project_name" {
  description = "The name of the project"
}

variable "project_id_prefix" {
  description = "A prefix to prepend to the generated project ID"
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
