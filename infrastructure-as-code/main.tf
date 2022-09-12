module "resourceGroups" {
  source                       = "./modules/resourceGroups"
  location                     = var.location
  name_of_shared_resourcegroup = "shared"
  name_of_logic_resourcegroup  = "logic"
}

resource "azurerm_user_assigned_identity" "uai_acr_capps_pull" {
  resource_group_name = module.resourceGroups.rg_shared_name_out
  location            = module.resourceGroups.rg_shared_location_out
  name                = "uai_acr_capps_pull"
}

module "containerRegistry" {
  source                = "./modules/containerRegistry"
  base_name             = "shared${var.system-name}"
  resource_group_name   = module.resourceGroups.rg_shared_name_out
  location              = module.resourceGroups.rg_shared_location_out
  sku                   = "Basic"
  adminEnabled          = true
  uai_acr_capps_pull_id = azurerm_user_assigned_identity.uai_acr_capps_pull.id
}

resource "azurerm_role_assignment" "uai_acr_capps_pull_assignment" {
  scope                = module.containerRegistry.cr_shared_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.uai_acr_capps_pull.principal_id
}

module "laws" {
  source              = "./modules/logAnalyticsWorkSpace"
  base_name           = var.system-name
  resource_group_name = module.resourceGroups.rg_shared_name_out
  location            = module.resourceGroups.rg_shared_location_out
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

module "cappEnvironment" {
  source      = "./modules/containerAppEnvironment"
  system_name = var.system-name
  location    = "uksouth" # there is no South-Africa option? :( 

  resource_group_id       = module.resourceGroups.rg_logic_id_out
  laws_workspace_id       = module.laws.laws_capps_workspace_workspace_id
  laws_primary_shared_key = module.laws.laws_capps_primary_shared_key
}

// NOTE: can't create the below untill there is a container in the ACR

module "webGateway" {
  source            = "./modules/apps/webgateway"
  location          = "uksouth"
  resource_group_id = module.resourceGroups.rg_logic_id_out

  capp_environment_id = module.cappEnvironment.aca_environment_id

  uai_acr_capps_pull_id    = azurerm_user_assigned_identity.uai_acr_capps_pull.id
  uai_acr_pull_resource_id = azurerm_user_assigned_identity.uai_acr_capps_pull.id

  cr_login_server = module.containerRegistry.cr_shared_login_server

  app_name       = "webgateway"
  app_image_name = "webgateway"
  app_image_tag  = "latest"
}
