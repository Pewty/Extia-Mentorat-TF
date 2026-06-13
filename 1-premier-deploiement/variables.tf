# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "api_token" {
  description = "Token to connect Proxmox API"
  type = string
  sensitive = true
}

variable "target_node" {
  description = "nom du noeud proxmox utilise"
  type = string
  default = "sd-120337"
}

variable "template_tag" {
  description = "nom du template qui sera utilise"
  type = string
  default = "terraform"
}

variable "vm_tags" {
  description = "Tag applique au VM creer par Terraform"
  type = list(string)
  default = ["TF-provisioning"]
}

variable "vm_hostname" {
  description = "nom du template qui sera utilise"
  type = string
  default = "TF-provision"
}

variable "domain" {
  description = "nom du domaine"
  type = string
  default = "pve"
}

variable "onboot" {
  description = "Auto start VM when node is start"
  type = string
  default = true
}

variable "cores" {
  description = "nombre de vcpu utilise"
  type = number
  default = 1
}

variable "sockets" {
  description = "nombre de sockets utilise"
  type = number
  default = 1
}

variable "memory" {
  description = "nombre de memoire utilise par la vm en MB"
  type = number
  default = 2148
}

variable "disk" {
  description = "taille du disque utilise"
  type = object({
    storage = string
    size = number
  })
  default = {
    storage = "local"
    size = 22
  }
}