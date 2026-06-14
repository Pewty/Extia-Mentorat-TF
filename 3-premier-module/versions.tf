# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.5.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = ">= 1.10"
    }
  }
  required_version = ">= 1.0"
}

provider "azurerm" {
  features {
    virtual_machine {
      #detach_implicit_data_disk_on_deletion = false
      delete_os_disk_on_deletion = true
      #graceful_shutdown                     = false
      #skip_shutdown_and_force_delete        = false
    }
  }
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}