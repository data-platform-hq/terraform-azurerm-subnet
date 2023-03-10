resource "azurerm_subnet" "this" {
  count = var.export_subnet_id == null ? 1 : 0

  name                                      = var.name
  resource_group_name                       = var.resource_group
  virtual_network_name                      = var.network
  private_endpoint_network_policies_enabled = var.private_endpoint_network_policies_enabled
  service_endpoints                         = var.service_endpoints
  address_prefixes                          = [var.cidr]

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
  subnet_id                 = var.export_subnet_id == null ? azurerm_subnet.this[0].id : var.export_subnet_id
  network_security_group_id = var.nsg_id
}
