variable "base_name" {
  type        = string
  description = "The base of the name for the resource group"
  validation {
    condition     = can(regex("^[a-z]+$", var.base_name))
    error_message = "For the base_name value only a-z are allowed."
  }
}

variable "location" {
  type        = string
  description = "The location for the deployment"
  validation {
    condition     = can(regex("^[a-z]+$", var.location))
    error_message = "For the location value only a-z are allowed."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "sku" {
  type        = string
  description = "The coptnainer registry's pricing tier Basic | Standard | Premium"
}

variable "adminEnabled" {
  type        = bool
  description = "Should the container registry's admin account be enabled"
}
