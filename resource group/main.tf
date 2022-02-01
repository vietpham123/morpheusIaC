terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

variable "appID" {
    type = string
    description = "AppId for Azure"
    default = ""
}

variable "client_secret" {
    type = string
    description = "Client Secret for Azure"
    default = ""
}

variable "tenant_ID" {
    type = string
    description = "Tenant ID for Azure"
    default = ""
}

variable "subscription_ID" {
    type = string
    description = "Subscription ID for Azure"
    default = ""
}

variable "azResourceGroupName" {
   type = string
   description = "Name of Azure Resource Group"
}

variable "azRegion" {
   type = string
   description = "Azure region to deploy in"
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