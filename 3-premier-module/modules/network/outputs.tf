
# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
# output "public_ip_address_id" {
#   value = azurerm_public_ip.pip.ip_address 
# }