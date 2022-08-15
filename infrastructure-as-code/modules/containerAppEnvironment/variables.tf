variable "system_name" {
  type        = string
  description = "Unique name for the system"
}

variable "location" {
  type        = string
  description = "The location for the deployment: northcentralusstage | canadacentral | westeurope | northeurope | eastus | eastus2 | eastasia | australiaeast | germanywestcentral | japaneast | uksouth | westus | centralus | northcentralus | southcentralus | koreacentral | brazilsouth"
  validation {
    condition     = can(regex("^[a-z]+$", var.location))
    error_message = "For the location value only a-z are allowed."
  }
}

variable "resource_group_id" {
  type        = string
  description = "Id of resource group"
}

variable "laws_workspace_id" {
  type        = string
  description = "The work space or customer Id"
}

variable "laws_primary_shared_key" {
  type        = string
  description = "The primary shared key"
}

# Azure Subscription Id
variable "azure-subscription-id" {
  type        = string
  description = "Azure Subscription Id"
}

# Azure Client Id/appId
variable "azure-client-id" {
  type        = string
  description = "Azure Client Id/appId"
}

# Azure Service principle secret
variable "azure-client-secret" {
  type        = string
  description = "Azure Service principle secret"
}

# Azure Tenant Id
variable "azure-tenant-id" {
  type        = string
  description = "Azure Tenant Id"
}
