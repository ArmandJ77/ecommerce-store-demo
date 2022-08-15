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

variable "capp_environment_id" {
  type        = string
  description = "Id of the managed environment"
}

variable "cr_login_server" {
  type        = string
  description = "Login server of the acr"
}

variable "cr_admin_user" {
  type        = string
  description = "Admin user of the container registry"
}

variable "cr_admin_password" {
  type        = string
  description = "Admin user passord of the container resigtry"
}

variable "app_image_name" {
  type        = string
  description = "Name of the docker image to be deployed"
  validation {
    condition     = can(regex("^[a-z]+$", var.app_image_name))
    error_message = "For the app_image_name value only a-z are allowed."
  }
}

variable "app_image_tag" {
  type        = string
  description = "Docker container image tag name"
}

variable "app_name" {
  type        = string
  description = "Name of the app"
  validation {
    condition     = can(regex("^[a-z]+$", var.app_name))
    error_message = "For the app_name value only a-z are allowed."
  }
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

