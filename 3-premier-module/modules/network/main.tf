# Generates a random pet name to use as a prefix for resources
resource "random_pet" "prefix" {}

# Creates an Azure Virtual Network within the specified Resource Group
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Creates a Subnet within the specified Virtual Network
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}