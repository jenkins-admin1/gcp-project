locals {
  project_name = lower(format("prj-%s-%s-%s", var.environment, var.app_short_name, random_string.suffix.result))
}

resource "google_project" "project" {
  name             = local.project_name
  project_id       = var.project_id
  labels           = var.labels
  org_id           = var.org_id
  billing_account  = var.billing_account
  folder_id        = var.folder_id[var.environment]
}

resource "google_project_services" "enable_services" {
  project  = google_project.project.project_id
  services = [
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "cloudapis.googleapis.com",
    "cloudtrace.googleapis.com"
  ]
}

resource "google_project_iam_binding" "owner" {
  project = google_project.project.project_id
  role    = "roles/owner"

  members = [
    "user:${var.owner_email}",
    "group:${var.owner_group_email}",
  ]
}

resource "random_string" "suffix" {
  length  = 4
  min_lower = 0
  min_numeric = 4
  min_special = 0
  min_upper = 0
  number = true
  lower = false
  upper = false
  special = false
}
