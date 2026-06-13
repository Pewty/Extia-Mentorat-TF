# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "name_of_vm" {
  value = proxmox_virtual_environment_vm.vm.name
}