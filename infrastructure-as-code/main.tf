module "resourceGroups" {
  source                       = "./modules/resourceGroups"
  location                     = var.location
  name_of_shared_resourcegroup = "shared"
  name_of_logic_resourcegroup  = "logic"
}

module "containerRegistry" {
  source              = "./modules/containerRegistry"
  base_name           = "shared${var.system-name}"
  resource_group_name = module.resourceGroups.rg_shared_name_out
  location            = module.resourceGroups.rg_shared_location_out
  sku                 = "Basic"
  adminEnabled        = true
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

  azure-client-id       = var.azure-client-id
  azure-client-secret   = var.azure-client-secret
  azure-subscription-id = var.azure-subscription-id
  azure-tenant-id       = var.azure-tenant-id
}

module "webGateway" {
  source            = "./modules/apps/webgateway"
  location          = "uksouth"
  resource_group_id = module.resourceGroups.rg_logic_id_out

  capp_environment_id = module.cappEnvironment.aca_environment_id

  cr_login_server   = module.containerRegistry.cr_shared_login_server
  cr_admin_user     = module.containerRegistry.cr_shared_admin_username
  cr_admin_password = module.containerRegistry.cr_shared_admin_password

  app_name       = "webgateway"
  app_image_name = "webgateway"
  app_image_tag  = "latest"

  azure-client-id       = var.azure-client-id
  azure-client-secret   = var.azure-client-secret
  azure-subscription-id = var.azure-subscription-id
  azure-tenant-id       = var.azure-tenant-id
}
