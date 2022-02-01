
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

variable "azVirtualNetworkName" {
   type = string
   description = "Azure Virtual network Name"
}

variable "azAddressCIDR" {
    type = string
    description = "Address CIDR for Virtual Network"
}

variable "azSubnet" {
    type = string
    description = "Name of Azure Subnet"
}

variable "azAddressPrefixes" {
    type = string
    description = "Address Prefix for Subnet"
}

variable "azNetworkSecurityGroup" {
    type = string
    description - "Name for Azure Network Security Group"
}