locals {
  project_id = "${var.project_id_prefix}-${substr(md5(random_string.random.hex), 0, 8)}"
}

data "google_folder" "folder" {
  folder_id = var.folder_id
}

resource "google_project" "project" {
  name       = var.project_name
  project_id = local.project_id
  labels     = var.labels
  org_id = var.organization_id
  billing_account = var.billing_account_id
  folder_id        = data.google_folder.folder.folder_id
}

resource "google_project_services" "enable_services" {
  project = google_project.project.project_id
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

resource "random_string" "random" {
  length  = 8
  special = false
}
