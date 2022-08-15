// TODO: Investigate managed identities so the ACA can pull with out the need of an acr admin user crednetial
output "cr_shared_login_server" {
  value = azurerm_container_registry.crshared.login_server
}

output "cr_shared_admin_username" {
  value = azurerm_container_registry.crshared.admin_username
}

output "cr_shared_admin_password" {
  value = azurerm_container_registry.crshared.admin_password
}
