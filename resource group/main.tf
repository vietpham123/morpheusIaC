terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_ID
  tenant_id = var.tenant_ID
  client_id = var.appID
  client_secret = var.client_secret
}

# Create an Azure Resource Group
resource "azurerm_resource_group" "morpheus" {
  name = var.azResourceGroupName
  location = var.azRegion
}