variable "system-name" {
  type        = string
  default     = "happeningfactory"
  description = "happeningfactory"
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

variable "location" {
  type    = string
  default = "southafricanorth"
  description = "The location of the resource: defualts to southafricanorth"
}

variable "rg-shared" {
  type    = string
  default = "rg-shared-za-north"
}

variable "capp-webgateway-image-name" {
  type    = string
  default = "webgateway"
}
