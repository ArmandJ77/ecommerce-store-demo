variable "base_name" {
  type        = string
  description = "Name for this resource"
}

variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "sku" {
  type        = string
  default     = "PerGB2018"
  description = "Free | PerNode | Premium | Standard | Standalone | Unlimited | CapacityReservation | PerGB2018"
}

variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730"
}
