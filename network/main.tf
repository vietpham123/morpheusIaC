terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.91.0"
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

# Create virtual network
resource "azurerm_virtual_network" "hashinet" {
  name                = var.azVirtualNetworkName
  address_space       = [var.azAddressCIDR]
  location            = var.hashiregion
  resource_group_name = var.hashirg

  tags = {
    environment = "Terraform Demo"
  }
}

# Create subnet
resource "azurerm_subnet" "hashisubnet" {
  name                 = var.azSubnet
  resource_group_name  = var.hashirg
  virtual_network_name = azurerm_virtual_network.hashinet.name
  address_prefixes     = [var.azAddressPrefixes]
}

# Create Network Security Group and Rule
resource "azurerm_network_security_group" "hashinsg" {
  name                = var.azNetworkSecurityGroup
  location            = var.hashiregion
  resource_group_name = var.hashirg

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "raddit"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9292"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}