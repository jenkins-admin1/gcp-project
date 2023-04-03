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
  app_short_name = "app1"
  owner_email = "app1-admin@markroofing.com"
  owner_group_email = "app1admin@markroofing.com"
  enabled_services = {
    "storage-component.googleapis.com" = "cloud storage"
  }
  labels = {
    environment = "dev"
    contact_name = "platform_team"
  }
}
