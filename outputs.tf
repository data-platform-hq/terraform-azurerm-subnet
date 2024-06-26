output "id" {
  value       = var.export_subnet_id == null ? azurerm_subnet.this[0].id : null
  description = "The ID of the subnet"
}

output "name" {
  value       = var.export_subnet_id == null ? azurerm_subnet.this[0].name : null
  description = "The name of the subnet"
}

output "address_prefixes" {
  value       = var.export_subnet_id == null ? azurerm_subnet.this[0].address_prefixes : null
  description = "The address prefixes to use for the subnet"
}

output "nsg_association_id" {
  value       = try(azurerm_subnet_network_security_group_association.this[0].id, null)
  description = "The ID of the Network Security Group Association"
}

output "nat_gateway_association_id" {
  value       = try(azurerm_subnet_nat_gateway_association.this[0].id, null)
  description = "The ID of the NAT Gateway Association"
}

output "route_table_association_id" {
  value       = try(azurerm_subnet_route_table_association.this[0].id, null)
  description = "The ID of the Route Table Association"
}

output "name_to_id_map" {
  value       = var.export_subnet_id == null ? { (azurerm_subnet.this[0].name) = azurerm_subnet.this[0].id } : null
  description = "Map of Subnet Name to Id"
}
