resource "azurerm_subnet" "this" {
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
  count = var.nsg_id == "" ? 0 : 1

  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = var.nsg_id
}
