# Data source pour vérifier si le RG existe déjà
# data "azurerm_resource_group" "rg_exists" {
#   count = length(regexall("^[a-zA-Z0-9-_()]+$", var.resource_group_name)) > 0 ? 1 : 0
#   name  = var.resource_group_name
# }

# Création du RG seulement s'il n'existe pas
resource "azurerm_resource_group" "rg" {
  # count    = length(data.azurerm_resource_group.rg_exists) == 0 ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}
