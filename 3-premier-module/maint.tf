resource "random_pet" "prefix" {}

module "deployRG" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = "West Europe"
}

module "deploynetwork" {
  source = "./modules/network"
  # resource_group_name = "RG-demoModule-TF-${random_pet.prefix.id}"
  resource_group_name = var.resource_group_name
  location            = "West Europe"
  vnetname            = "${var.prefixVM}-vnet"
  subnet_name         = "${var.prefixVM}-subnet"

  depends_on = [ module.deployRG ]
}

module "deployvm" {
  source = "./modules/vm_linux"
  # resource_group_name  = "RG-demoModule-TF-${random_pet.prefix.id}"
  resource_group_name  = var.resource_group_name
  location             = "West Europe"
  subnet_id            = module.deploynetwork.subnet_id
  linux_distribution_name = "ubuntu1604" #Value available are debian11_Bullseye, redhat81, ubuntu1604
  virtual_machine_name = "${var.prefixVM}-vm-01"
  admin_password       = var.admin_password
  virtual_machine_size = "Standard_B1s"

  depends_on = [ module.deployRG ]
}
