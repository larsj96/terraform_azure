resource "azurerm_key_vault" "common_key_vault" {
  name                        = "kv-common-webapps"
  location                    = azurerm_resource_group.resource_group["common"].location
  resource_group_name         = azurerm_resource_group.resource_group["common"].name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  # get tags from the root RG
  tags = azurerm_resource_group.resource_group["common"].tags
}

resource "random_string" "kv_suffix" {
  length  = 8
  special = false
  upper   = false
}





# resource "azurerm_key_vault_access_policy" "webapps_policy" {
#   for_each = azurerm_static_web_app.static_web_app

#   key_vault_id = azurerm_key_vault.common_key_vault.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = each.value.id

#   key_permissions    = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
#   secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
# }