terraform {
  source = "../../../../../src/project-creator"
}
/*
include {
  path = find_in_parent_folders()
}
*/
inputs = {
  environment = "dev"
  folder_id = var.folder_id["dev"]  # Replace "dev" with "qa" as needed
  app_short_name = "app1"
  owner_email = "app1-admin@markroofing.com"
  owner_group_email = "app1admin@markroofing.com"
  enabled_services = {
    "storage-component.googleapis.com" = "cloud storage"
  }
  labels = {
    environment = local.environment
    app_short_name = local.app_short_name
  }
  project_name = "${local.environment}-${local.app_short_name}"
  project_id_prefix = "${local.environment}-${local.app_short_name}"
}
