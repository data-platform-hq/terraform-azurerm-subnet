output "id" {
  value       = azurerm_subnet.this.id
  description = "The ID of the subnet"
}

output "name" {
  value       = azurerm_subnet.this.name
  description = "The name of the subnet"
}

output "address_prefixes" {
  value       = azurerm_subnet.this.address_prefixes
  description = "The address prefixes to use for the subnet"
}

output "nsg_association_id" {
  value       = var.export_subnet_id == null ? azurerm_subnet_network_security_group_association.this[0].id : null
  description = "The ID of the Network Security Group Association"
}

output "name_to_id_map" {
  value       = { (azurerm_subnet.this.name) = azurerm_subnet.this.id }
  description = "Map of Subnet Name to Id"
}
