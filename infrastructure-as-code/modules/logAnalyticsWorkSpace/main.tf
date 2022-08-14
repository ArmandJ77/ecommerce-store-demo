resource "azurerm_log_analytics_workspace" "laws-capps" {
  name                = "laws-capps-${var.base_name}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
}
