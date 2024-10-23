terraform {
  required_version = "~> 1.5.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.3.0"
    }
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.16.1"
    }
  }
}

provider "azuredevops" {
  # Configuration options
  org_service_url       = "https://dev.azure.com/nzcloudcrew/" #"https://dev.azure.com/${var.azuredevops_settings.organization}"
  personal_access_token = var.azuredevops_personal_token
}

provider "spacelift" {
  api_key_endpoint = "https://cloudcrewnz.app.spacelift.io"
  api_key_id       = var.spacelift_key_id
  api_key_secret   = var.spacelift_key_secret
}
