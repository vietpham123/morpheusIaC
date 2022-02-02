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

}

# Create an Azure Resource Group
resource "azurerm_resource_group" "morpheus" {
  name = var.azResourceGroupName
  location = var.azRegion
}