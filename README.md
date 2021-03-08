# terraform-azurerm-vnet

## Create a basic network in Azure

This Terraform module deploys a Virtual Network in Azure with a subnet or a set of subnets passed in as input parameters.

The module does not create nor expose a security group.

## Usage in Terraform
```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "my-resources"
  location = "West Europe"
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = "10.0.0.0/16"
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]
}
```

## Authors

Created by Chris Discianno

## License

[MIT](https://dev.azure.com/discianno-consulting/Lab/_git/terraform-azure-vnet?path=%2FLICENSE.MD)