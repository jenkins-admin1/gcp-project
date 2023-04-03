terraform {
  source = "../../../../../src/project-creator"
}

inputs = {
  environment = "dev"
  app_short_name = "app1"
  labels = {
    environment = local.environment
    app_short_name = local.app_short_name
  }
  enabled_services = {
    "storage-component.googleapis.com"             = "cloud storage"
  }
}

include {
  path = find_in_parent_folders()
}

locals {
  folder_name = local.environment == "dev" ? "dev" : "qa"
}

inputs = merge([
  local,
  {
    project_name = "${local.environment}-${local.app_short_name}"
    project_id_prefix = "${local.environment}-${local.app_short_name}"
    #organization_id = "your-organization-id"
    owner_email = "app1-admin@markroofing.com"
    owner_group_email = "app1admin@markroofing.com"
    #billing_account_id = "your-billing-account-id"
  }
])
