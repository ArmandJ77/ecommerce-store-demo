resource "azapi_resource" "aca-environment" {
  name     = "aca-${var.system_name}-environment"
  type     = "Microsoft.App/managedEnvironments@2022-03-01"
  location = var.location
  #"uksouth"
  parent_id = var.resource_group_id
  body = jsonencode({
    properties = {
      appLogsConfiguration = {
        destination = "log-analytics"
        logAnalyticsConfiguration = {
          customerId = var.log_analytics_work_space_id
          sharedKey  = var.log_analytics_work_space_primary_shared_key
        }
      }
    }
  })
}
