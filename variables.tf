variable "name" {
  type        = string
  description = "The name of the subnet"
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group in which to create the storage account"
}

variable "network" {
  type        = string
  description = "The name of the virtual network in which the subnet is created in"
}

variable "cidr" {
  type        = string
  description = "The address prefixes to use for the subnet"
}

variable "private_endpoint_network_policies_enabled" {
  type        = bool
  description = "Enable or Disable network policies for the private link endpoint on the subnet. Setting this to true will Disable the policy and setting this to false will Enable the policy: [true|false]"
  default     = true
}

variable "service_endpoints" {
  type        = list(string)
  description = "The list of Service endpoints to associate with the subnet: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, Microsoft.Web"
  default = [
    "Microsoft.Storage",
    "Microsoft.KeyVault",
    "Microsoft.Sql",
    "Microsoft.Web"
  ]
}

variable "delegations" {
  type = list(object({
    name    = string
    actions = list(string)
  }))
  description = "(optional) subnet delegation"
  default     = []
}

variable "nsg_id" {
  type        = string
  description = "The ID of the Network Security Group which should be associated with the Subnet"
  default     = ""
}
