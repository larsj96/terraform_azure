# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/managed_service_identity

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
     version = "3.100.0"
    }
  }
}

provider "azurerm" {
  features {}
}