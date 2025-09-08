terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.43.0"
    }
    fabric = {
      source  = "microsoft/fabric"
      version = "1.5.0"  # adjust to latest
    }
  }
}

provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = data.azurerm_key_vault_secret.client_id.value
  client_secret   = data.azurerm_key_vault_secret.client_secret.value
  features {}
}
