
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
