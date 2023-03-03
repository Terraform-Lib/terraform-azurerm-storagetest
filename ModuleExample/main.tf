terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

module "ResoureGroup" {
  source    = "./ResourceGroup"
  base_name = "ExampleRG01"
  location  = "west us"

}

module "StorageAccount" {
  source              = "./StorageAccount"
  base_name           = "ExampleStorage01"
  resource_group_name = module.ResoureGroup.rg_name_out
  location            = "west us"

}