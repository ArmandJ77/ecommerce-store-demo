resource "azapi_resource" "aca-environment" {
  name      = "aca-${var.system_name}-environment"
  type      = "Microsoft.App/managedEnvironments@2022-01-01-preview"
  location  = var.location
  parent_id = var.resource_group_id
  body = jsonencode({
    properties = {
      appLogsConfiguration = {
        destination = "log-analytics"
        logAnalyticsConfiguration = {
          customerId = "${var.laws_workspace_id}"
          sharedKey  = "${var.laws_primary_shared_key}"
        }
      }
    }
  })
}
