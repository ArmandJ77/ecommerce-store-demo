variable "system_name" {
  type        = string
  description = "Unique name for the system"
}

variable "location" {
  type        = string
  description = "The location for the deployment"
  validation {
    condition     = can(regex("^[a-z]+$", var.location))
    error_message = "For the location value only a-z are allowed."
  }
}

variable "resource_group_id" {
  type = string
}

variable "log_analytics_work_space_id" {
  type = string
}

variable "log_analytics_work_space_primary_shared_key" {
  type = string
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
