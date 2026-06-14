# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "subscription_id" {
  description = "id of your Azure Subscription"
  sensitive = true
}

variable "tenant_id" {
  description = "id of your Azure Tenant"
  sensitive = true
}

variable "admin_password" {
  description = "Password of root VM"
  sensitive = true
}

variable "resource_group_name" {
  description = "Name of your resource group where resource will be deployed"
  type = string
}

variable "location" {
  type = string
  default = "West Europe"
  description = "location where are deploy the cluster"
}
variable "prefixRG" {
  default = "RG"
}

variable "location_RG" {
  type = string
  default = "West Europe"
  description = "location where are deploy the Ressource Group"
}

variable "prefixVM" {
  default = "slaz"
}