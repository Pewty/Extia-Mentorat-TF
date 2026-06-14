variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "location" {
  description = "location where are deploy the Ressource Group"
  type        = string
  default     = "West Europe"
}

variable "vnetname" {
  description = "name of the vnet"
  type = string
}

variable "prefixVM" {
  default = "slaz"
}

variable "subnet_name" {
  description = "name of the subnet"
  type = string
}
