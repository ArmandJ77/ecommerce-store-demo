resource "azurerm_resource_group" "rg-shared" {
  name     = var.name_of_shared_resourcegroup
  location = var.location
}

resource "azurerm_resource_group" "rg-logic" {
  name     = var.name_of_logic_resourcegroup
  location = var.location
}

