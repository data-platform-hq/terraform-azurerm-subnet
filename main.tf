resource "azurerm_subnet" "this" {
  count = var.export_subnet_id == null ? 1 : 0

  name                                          = var.name
  resource_group_name                           = var.resource_group
  virtual_network_name                          = var.network
  private_endpoint_network_policies             = var.private_endpoint_network_policies
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  service_endpoints                             = var.service_endpoints
  address_prefixes                              = [var.cidr]

  dynamic "delegation" {
    for_each = var.delegations
    content {
      name = "subnet-delegation-${var.name}"
      service_delegation {
        name    = delegation.value["name"]
        actions = delegation.value["actions"]
      }
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "this" {
  count = var.nsg_association_enabled ? 1 : 0

  subnet_id                 = var.export_subnet_id == null ? azurerm_subnet.this[0].id : var.export_subnet_id
  network_security_group_id = var.nsg_id
}

resource "azurerm_subnet_nat_gateway_association" "this" {
  count = var.nat_gateway_association_enabled ? 1 : 0

  subnet_id      = var.export_subnet_id == null ? azurerm_subnet.this[0].id : var.export_subnet_id
  nat_gateway_id = var.nat_gateway_id
}

resource "azurerm_subnet_route_table_association" "this" {
  count = var.route_table_association_enabled ? 1 : 0

  subnet_id      = var.export_subnet_id == null ? azurerm_subnet.this[0].id : var.export_subnet_id
  route_table_id = var.route_table_id
}
