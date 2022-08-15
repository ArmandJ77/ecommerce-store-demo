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

# resource "azapi_resource" "capp-webgateway" {
#   name      = "capp-webgateway"
#   location  = var.location
#   parent_id = azurerm_resource_group.rg-capps-demo-day.id
#   type      = "Microsoft.App/containerApps@2022-03-01"
#   body = jsonencode({
#     properties = {
#       managedEnvironmentId = azapi_resource.aca-demo-environment.id
#       configuration = {
#         ingress = {
#           targetPort = 80
#           external   = true
#         },
#         registries = [
#           {
#             server            = azurerm_container_registry.crshared.login_server
#             username          = azurerm_container_registry.crshared.admin_username
#             passwordSecretRef = "registry-password"
#           }
#         ],
#         secrets : [
#           {
#             name = "registry-password"
#             # Todo: Container apps does not yet support Managed Identity connection to ACR
#             value = azurerm_container_registry.crshared.admin_password
#           }
#         ]
#       },
#       template = {
#         containers = [
#           {
#             image = "${azurerm_container_registry.crshared.login_server}/services/${var.capp-webgateway-image-name}:latest"
#             resources = {
#               cpu    = 0.25,
#               memory = "0.5Gi"
#             }
#             name = "webgateway",
#             env : [
#               {
#                 "name" : "EnvVariable",
#                 "value" : "Value"
#               }
#             ],
#             probes : [
#               {
#                 type : "Startup"
#                 failureThreshold : 3,
#                 successThreshold : 1,
#                 initialDelaySeconds : 3,
#                 periodSeconds : 3,
#                 httpGet : {
#                   path : "/startup",
#                   port : 80,
#                 },
#               },
#               {
#                 type : "Readiness"
#                 failureThreshold : 3,
#                 successThreshold : 1,
#                 initialDelaySeconds : 5,
#                 periodSeconds : 3,
#                 httpGet : {
#                   path : "/readiness",
#                   port : 80,
#                 },
#               },
#               {
#                 type : "Liveness"
#                 failureThreshold : 3,
#                 successThreshold : 1,
#                 initialDelaySeconds : 7,
#                 periodSeconds : 10,
#                 httpGet : {
#                   path : "/health",
#                   port : 80,
#                   httpHeaders : [
#                     {
#                       name : "Custom-Header",
#                       value : "liveness probe"
#                   }]
#                 },
#               },
#             ],
#           }
#         ],
#         scale : {
#           maxReplicas : 1,
#           minReplicas : 1,
#         },

#       }
#     }
#   })
#   # This seems to be important for the private registry to work(?)
#   ignore_missing_property = true
#   response_export_values  = ["properties.configuration.ingress"]
# }

# resource "azurerm_resource_group" "rg-capps-sandbox-za-north" {
#   location = var.location
#   name     = "rg-capps-sandbox-za-north"
# }



