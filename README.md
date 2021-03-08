# terraform-azurerm-vnet

## Create a basic network in Azure

This Terraform module deploys a Virtual Network in Azure with a subnet or a set of subnets passed in as input parameters.

The module does not create nor expose a security group.

## Usage in Terraform

### vars.tf
```hcl
variable "client_id" {
    description = "Environment variable. Do not define."
}

variable "client_secret" {
    description = "Environment variable. Do not define."
}

variable "tenant_id" {
    description = "Environment variable. Do not define."
}

variable "subscription_id" {
    description = "ID of subscription"
}

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
```
### terraform.tfvars
```hcl
subscription_id     = ""
resource_group_name = ""
vnet_name           = ""
address_space       = ""
dns_servers         = ""
subnet_names        = ""
subnet_prefixes     = ""
```

### main.tf
```hcl
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "2.50.0"
        }
    }
}

provider "azurerm" {
    client_id       = var.client_id
    client_secret   = var.client_secret
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id

    features {}
}

module "vnet" {
    source              = "Azure/vnet/azurerm"
    resource_group_name = var.resource_group_name
    vnet_name           = var.vnet_name
    address_space       = var.address_space
    dns_servers         = var.dns_servers
    subnet_names        = var.subnet_names
    subnet_prefixes     = var.subnet_prefixes
}

## Authors

Created by Chris Discianno

## License

[MIT](https://github.com/cdiscianno/terraform-azurerm-vnet/blob/master/LICENSE.MD)