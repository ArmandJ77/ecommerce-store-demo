terraform {
  required_providers {
    azapi = {
      source = "azure/azapi"
    }
  }
}

provider "azapi" {
  default_location = var.location
}
