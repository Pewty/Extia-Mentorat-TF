
# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "virtual_machine_name" {
  value = azurerm_linux_virtual_machine.vmlinux.name
}

output "virtual_machine_user" {
  value = azurerm_linux_virtual_machine.vmlinux.admin_username
}
# output "public_ip_address_id" {
#   value = azurerm_public_ip.pip.ip_address 
# }