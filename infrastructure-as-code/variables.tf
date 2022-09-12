variable "system-name" {
  type        = string
  default     = "happeningfactory"
  description = "happeningfactory"
}

variable "location" {
  type        = string
  default     = "southafricanorth"
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
