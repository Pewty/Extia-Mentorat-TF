# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "resource_group_name" {
  value = module.deployRG.resource_group_name
}

output "virtual_machine_name" {
  value = module.deployvm.virtual_machine_name
}

output "virtual_machine_user" {
  value = module.deployvm.virtual_machine_user
  sensitive = true
}

output "public_ip_address_id" {
  value = azurerm_public_ip.pip.ip_address
}