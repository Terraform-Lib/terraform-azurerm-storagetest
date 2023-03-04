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
  base_name = var.base_name_module_rg
  location  = var.location_module_rg

}

module "StorageAccount" {
  source              = "./StorageAccount"
  base_name           = var.base_name_module_storage
  resource_group_name = module.ResoureGroup.rg_name_out
  location            = var.location_module_storage

}
