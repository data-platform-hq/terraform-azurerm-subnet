output "id" {
  value = azurerm_subnet.this.id
}

output "name" {
  value = azurerm_subnet.this.name
}

output "address_prefixes" {
  value = azurerm_subnet.this.address_prefixes
}

output "nsg_association_id" {
  value = var.nsg_id == "" ? "" : azurerm_subnet_network_security_group_association.this[0].id
}
