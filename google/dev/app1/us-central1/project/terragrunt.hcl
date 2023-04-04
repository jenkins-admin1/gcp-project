//defining the source module for the terragrunt file
terraform {
  source = "../../../../..//src//project-creator"
}


inputs = {
  environment = "dev" //dev, qa are acceptable values
  app_short_name = "app1" //should not be more than 5 characters
  owner_email = "app1-admin@markroofing.com" //project owner email id
  owner_group_email = "app1admin@markroofing.com" //gropu of owners
  activate_apis = ["storage-component.googleapis.com"] //by default compute and iam apis are enabled in the project
  labels = {
    environment = "dev"
    contact_name = "platform_team"
  }
}
