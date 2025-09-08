variable "key_vault_name" {
  type = string
  default = "my-keyvault"
}

variable "client_id_secret_name" {
  type = string
  default = "client-id"
}

variable "client_secret_secret_name" {
  type = string
  default = "client-secret"
}

variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}
