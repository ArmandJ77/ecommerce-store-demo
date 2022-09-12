terraform {
  required_providers {
    azapi = {
      source = "azure/azapi"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.2"
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
}

provider "azapi" {
  default_location = var.location
}
