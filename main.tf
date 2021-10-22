provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = var.boolean_map.true
    }
  }
}

locals {
  tags = var.tags
}

data "azurerm_client_config" "current" {
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${var.rg_name}-${var.env_name}"
  location = var.location[0]
}

resource "azurerm_key_vault" "this" {
  name                            = "kv-${var.key_vault_name}-${var.env_name}"
  location                        = azurerm_resource_group.this.location
  resource_group_name             = azurerm_resource_group.this.name
  enabled_for_disk_encryption     = var.boolean_map.true
  enabled_for_deployment          = var.boolean_map.false
  enabled_for_template_deployment = var.boolean_map.false
  enable_rbac_authorization       = var.boolean_map.false
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.boolean_map.false
  sku_name                        = var.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
  }

  tags = local.tags
}
