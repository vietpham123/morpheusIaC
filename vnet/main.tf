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

# Create virtual network
resource "azurerm_virtual_network" "hashinet" {
  name                = "vpVnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.azResourceGroupName
  resource_group_name = var.azRegion

  tags = {
    environment = "Terraform Demo"
  }
}

# Create subnet
resource "azurerm_subnet" "hashisubnet" {
  name                 = "vpSubnet"
  resource_group_name  = var.azRegion
  virtual_network_name = azurerm_virtual_network.hashinet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create Network Security Group and Rule
resource "azurerm_network_security_group" "hashinsg" {
  name                = "vpNetworkSecurityGroup"
  location            = var.azRegion
  resource_group_name = var.azResourceGroupName

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

output "virtual_network" {
    value = azurerm_virtual_network.hashinet.name
}

output "subnet_name" {
    value = azurerm_subnet.hashisubnet.id
}

output "nsg" {
    value = azurerm_network_security_group.hashinsg.id
}