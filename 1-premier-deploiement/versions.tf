# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.86.0"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://198.18.0.2:8006/"
  api_token = var.api_token
  insecure  = true
  ssh {
    agent    = true
    username = "svc_terraform"
  }
}