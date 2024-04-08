resource "azurerm_storage_account" "storage_account" {
  for_each = azurerm_resource_group.resource_group

  name                     = "${substr(replace(each.key, "-", ""), 0, 12)}storage${random_string.storage_suffix.result}"
  resource_group_name      = each.value.name # Gettings RG name from the root RG 
  location                 = each.value.location # Gettings location from the root RG 
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = each.value.tags # Gettings tags from the root RG 
}

resource "random_string" "storage_suffix" {
  length  = 4
  special = false
  upper   = false
}