variable "name_of_shared_resourcegroup" {
  type        = string
  description = "Name for all the shared resources in this environment"
}

variable "name_of_logic_resourcegroup" {
  type        = string
  description = "Name for the logic tier in this environment"
}

variable "location" {
  type        = string
  description = "The location for the deployment"
}
