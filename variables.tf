variable "env_name" {
  type    = string
  default = "dev"
}
variable "rg_name" {
  type    = string
  default = "default"
}

variable "key_vault_name" {
  type    = string
  default = "key-vault"
}

variable "location" {
  type    = list(string)
  default = ["east US"]
}

variable "boolean_map" {
  type = map(bool)
  default = {
    "true"  = true,
    "false" = true
  }
}

variable "soft_delete_retention_days" {
  type    = number
  default = 7
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "tags" {
  type = map(string)
  default = {
    "environment" = "dev"
  }
}
