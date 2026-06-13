data "proxmox_virtual_environment_vms" "template" {
  node_name = var.target_node
  tags      = ["template", var.template_tag]
}

data "proxmox_virtual_environment_pool" "tf_pool" {
  pool_id = "Mentorat_Terraform"
}

resource "random_integer" "id_vm" {
  max = 1000
  min = 500
}

resource "proxmox_virtual_environment_vm" "vm" {
  name      = "${var.vm_hostname}${random_integer.id_vm.result}"
  node_name = var.target_node
  vm_id     = random_integer.id_vm.result
  # on_boot = var.onboot
  pool_id = data.proxmox_virtual_environment_pool.tf_pool.id

  agent {
    enabled = false
  }

  stop_on_destroy = true
  tags            = var.vm_tags

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    # utiliser le type de cpu par defaut qui est qemu64
    # type    = "x86-64-v2-AES"
    cores   = var.cores
    sockets = var.sockets
    # flags   = []
  }

  memory {
    dedicated = var.memory
  }

  network_device {
    bridge = "vmbr3"
    model  = "virtio"
  }

  # Ignore changes to the network
  ## MAC address is generated on every apply, causing
  ## TF to think this needs to be rebuilt on every apply
  lifecycle {
    ignore_changes = [
      network_device,
    ]
  }

  boot_order    = ["scsi0", "ide2", "net0"]
  scsi_hardware = "virtio-scsi-single"

  disk {
    interface    = "scsi0"
    iothread     = true
    datastore_id = var.disk.storage
    size         = var.disk.size
    discard      = "ignore"
  }

  clone {
    vm_id = data.proxmox_virtual_environment_vms.template.vms[0].vm_id
  }

  #   initialization {
  # ip_config {
  #   ipv4 {
  #     address = "dhcp"
  #   }
  # }

  #     datastore_id         = "local"
  #     interface            = "ide2"
  #     user_data_file_id    = proxmox_virtual_environment_file.cloud_user_config.id
  #     meta_data_file_id    = proxmox_virtual_environment_file.cloud_meta_config.id
  #   }
}

# resource "proxmox_virtual_environment_file" "cloud_user_config" {
#   content_type = "snippets"
#   datastore_id = "local"
#   node_name    = var.target_node

#   source_raw {
#     data = file("cloud-init/user_data")

#     file_name = "${var.vm_hostname}.${var.domain}-ci-user.yml"
#   }
# }

# resource "proxmox_virtual_environment_file" "cloud_meta_config" {
#   content_type = "snippets"
#   datastore_id = "local"
#   node_name    = var.target_node

#   source_raw {
#     data = templatefile("cloud-init/meta_data",
#       {
#         instance_id    = sha1(var.vm_hostname)
#         local_hostname = var.vm_hostname
#       }
#     )

#     file_name = "${var.vm_hostname}.${var.domain}-ci-meta_data.yml"
#   }
# }
