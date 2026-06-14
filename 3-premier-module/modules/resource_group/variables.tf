variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
}

variable "location" {
  description = "location where are deploy the Ressource Group"
  type        = string
  default     = "West Europe"
}