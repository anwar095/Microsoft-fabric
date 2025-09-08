data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = "your-keyvault-rg"  # replace with your RG name
}

# Data source: get the client id secret from Key Vault
data "azurerm_key_vault_secret" "client_id" {
  name         = var.client_id_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

# Data source: get the client secret from Key Vault
data "azurerm_key_vault_secret" "client_secret" {
  name         = var.client_secret_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_client_config" "current" {}
