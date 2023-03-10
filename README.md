# Azure Network Subnet Terraform module
Terraform module for creation Azure Network Subnet

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.this_import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The address prefixes to use for the subnet | `string` | n/a | yes |
| <a name="input_delegations"></a> [delegations](#input\_delegations) | (optional) subnet delegation | <pre>list(object({<br>    name    = string<br>    actions = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the subnet | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The name of the virtual network in which the subnet is created in | `string` | n/a | yes |
| <a name="input_nsg_id"></a> [nsg\_id](#input\_nsg\_id) | The ID of the Network Security Group which should be associated with the Subnet | `string` | `""` | no |
| <a name="input_private_endpoint_network_policies_enabled"></a> [private\_endpoint\_network\_policies\_enabled](#input\_private\_endpoint\_network\_policies\_enabled) | Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy: [true\|false] | `bool` | `true` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group in which to create the storage account | `string` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | The list of Service endpoints to associate with the subnet: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, Microsoft.Web | `list(string)` | <pre>[<br>  "Microsoft.Storage",<br>  "Microsoft.KeyVault",<br>  "Microsoft.Sql"<br>]</pre> | no |
| <a name="input_export_subnet_id"></a> [export\_subnet\_id](#input\_export\_subnet\_id) | Exported subnet id | `string` | null | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_prefixes"></a> [address\_prefixes](#output\_address\_prefixes) | The address prefixes to use for the subnet |
| <a name="output_id"></a> [id](#output\_id) | The ID of the subnet |
| <a name="output_name"></a> [name](#output\_name) | The name of the subnet |
| <a name="output_nsg_association_id"></a> [nsg\_association\_id](#output\_nsg\_association\_id) | The ID of the Network Security Group Association |
| <a name="name_to_id_map"></a> [id](#output\_name\_to\_id\_map) | Map of Subnet Name to Id |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-subnet/tree/main/LICENSE)
