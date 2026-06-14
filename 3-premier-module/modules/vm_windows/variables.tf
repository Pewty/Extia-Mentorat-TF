variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
}

variable "location" {
  description = "location where are deploy the Ressource Group"
  type        = string
  default     = "West Europe"
}

variable "subnet_id" {
  description = "id of the subscription we have created"
  type = string
}

variable "prefixVM" {
  default = "swaz"
}

variable "virtual_machine_size" {
  description = "The Virtual Machine SKU for the Virtual Machine, Default is Standard_A2_V2"
  default     = "Standard_B2s"
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  default     = ""
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine."
  default     = "adminuserSopra"
}
variable "admin_password" {
  description = "The password of the local administrator used for the Virtual Machine."
  sensitive   = true

}

variable "source_image_id" {
  description = "The ID of an Image which each Virtual Machine should be based on"
  default     = null
}
variable "custom_image" {
  description = "Provide the custom image to this module if the default variants are not sufficient"
  type = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
  default = null
}

variable "linux_distribution_list" {
  description = "Pre-defined Azure Linux VM images list"
  type = map(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))

  default = {
    ubuntu1604 = {
      publisher = "canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    debian11_Bullseye = {
      publisher = "debian"
      offer     = "debian-11"
      sku       = "11"
      version   = "latest"
    }
  }

}
variable "linux_distribution_name" {
  default     = "ubuntu1604"
  description = "Variable to pick an OS for Linux based VM. Possible values include: debian11_Bullseye, ubuntu1604"
}

variable "os_disk_caching" {
  default = "ReadWrite"
}
variable "os_disk_storage_account_type" {
  default = "Standard_LRS"
}
