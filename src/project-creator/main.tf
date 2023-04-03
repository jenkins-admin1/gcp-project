locals {
  project_name = lower(format("prj-%s-%s-%s", var.environment, var.app_short_name, random_string.suffix.result))
  service_account_id = lower(format("%s-%s", var.app_short_name, random_string.service_account_id.result))
}

resource "google_project" "project" {
  name             = local.project_name
  project_id       = local.project_name
  labels           = var.labels
  billing_account  = var.billing_account
  folder_id        = var.folder_id[var.environment]
}

resource "google_project_service" "enable_services" {
  project  = google_project.project.project_id
  for_each = toset(concat(["compute.googleapis.com", "iam.googleapis.com"], var.activate_apis))
  service = each.value
  disable_on_destroy = true
  disable_dependent_services = true
}

resource "google_service_account" "service_account" {
  account_id   = local.service_account_id
  display_name = "default service account"
  project = google_project.project.project_id
}

resource "google_project_iam_binding" "owner" {
  project = google_project.project.project_id
  role    = "roles/owner"

  members = [
    "user:${var.owner_email}",
    "group:${var.owner_group_email}",
  ]
}

resource "google_project_iam_binding" "compute_admin" {
  project = google_project.project.project_id
  role    = "roles/compute.admin"

  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}

resource "random_string" "suffix" {
  length  = 4
  min_lower = 0
  min_numeric = 4
  min_special = 0
  min_upper = 0
  numeric = true
  lower = false
  upper = false
  special = false
}

resource "random_string" "service_account_id" {
  length  = 4
  min_lower = 0
  min_numeric = 4
  min_special = 0
  min_upper = 0
  numeric = true
  lower = false
  upper = false
  special = false
}