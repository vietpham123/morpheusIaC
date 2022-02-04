terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

variable "azResourceGroupName" {
    type = string
    description = "Desired Resource Group Name"
}

variable "azRegion" {
    type = string
    description = "Desired Azure Region"
}

variable "subscription_ID" {
    type = string
}

variable "tenant_ID" {
    type = string
}

variable "client_ID" {
    type = string
}

variable "client_secret" {
    type = string
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_ID
  tenant_id = var.tenant_ID
  client_id = var.client_ID
  client_secret = var.client_secret
}

# Create an Azure Resource Group
resource "azurerm_resource_group" "morpheus" {
  name = var.azResourceGroupName
  location = var.azRegion
}
