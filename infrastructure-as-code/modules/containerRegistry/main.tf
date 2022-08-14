resource "azurerm_container_registry" "crshared" {
  name                = "cr${var.base_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.adminEnabled
}
