variable "resource_group_name" {
    description = "Name of resource group to add vnet to"
}

variable "vnet_name" {
    description = "Name of the vnet to create"
}

variable "address_space" {
    type        = "list(string)"
    description = "The address space to use for network"
    default     = ["10.0.0.0/16"]
}

variable "dns_servers" {
    description = "DNS servers for network. Defaults to Azure based DNS servers"
    default     = []
}

variable "subnet_names" {
    description = "List of subnets within the vnet"
    default     = ["default"]
}

variable "subnet_prefixes" {
    description = "The address prefixes for each subnet"
    default     = ["10.0.0.0/24"] 
}