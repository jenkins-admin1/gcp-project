terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.9.0"
    }
  }
}

provider "google" {
  project     = "tidy-surge-408016"
  region      = "us-central1"
}