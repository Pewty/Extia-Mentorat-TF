
# output "resource_group_name" {
#   description = "Nom du Resource Group"
#   value = data.azurerm_resource_group.rg_exists == "" ? data.azurerm_resource_group.rg_exists[0].name : azurerm_resource_group.rg.name
#   # value       = length(data.azurerm_resource_group.existing) > 0 ? data.azurerm_resource_group.existing[0].name : azurerm_resource_group.rg[0].name
# }

# output "resource_group_id" {
#   description = "ID du Resource Group"
#   # value       = length(data.azurerm_resource_group.existing) > 0 ? data.azurerm_resource_group.existing[0].id : azurerm_resource_group.rg[0].id
#   value = data.azurerm_resource_group.rg_exists == "" ? data.azurerm_resource_group.rg_exists[0].id : azurerm_resource_group.rg.id
# }

# output "resource_group_location" {
#   description = "Localisation du Resource Group"
#   # value       = length(data.azurerm_resource_group.existing) > 0 ? data.azurerm_resource_group.existi.location : azurerm_resource_group.rg[0].location
#   value = data.azurerm_resource_group.rg_exists == "" ? data.azurerm_resource_group.rg_exists[0].location : azurerm_resource_group.rg.location
# }

output "resource_group_name" {
  description = "Nom du Resource Group"
  value = azurerm_resource_group.rg.name
  # value       = length(data.azurerm_resource_group.rg_exists) > 0 ? data.azurerm_resource_group.rg_exists[0].name : azurerm_resource_group.rg[0].name
}

output "resource_group_id" {
  description = "ID du Resource Group"
  value = azurerm_resource_group.rg.id
}

output "resource_group_location" {
  description = "Localisation du Resource Group"
  value       = azurerm_resource_group.rg.location
}

# output "resource_group_id" {
#   description = "ID du Resource Group"
#   value       = length(data.azurerm_resource_group.rg_exists) > 0 ? data.azurerm_resource_group.rg_exists[0].id : azurerm_resource_group.rg[0].id
# }

# output "resource_group_location" {
#   description = "Localisation du Resource Group"
#   value       = length(data.azurerm_resource_group.rg_exists) > 0 ? data.azurerm_resource_group.rg_exists[0].location : azurerm_resource_group.rg[0].location
# }