resource "random_string" "storage_suffix" {
  length  = 8
  special = false
  upper   = false
}


resource "azurerm_storage_account" "storage_account" {
  for_each = azurerm_resource_group.resource_group

  name                     = "${substr(replace(each.key, "-", ""), 0, 12)}storage${random_string.storage_suffix.result}"
  resource_group_name      = each.value.name # Gettings RG name from the root RG 
  location                 = each.value.location # Gettings location from the root RG 
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = each.value.tags # Gettings tags from the root RG 
}



resource "azurerm_storage_management_policy" "storage_account_policy" {
  for_each            = azurerm_storage_account.storage_account

  storage_account_id = each.value.id

  rule {
    name    = "retention-policy"
    enabled = true
    filters {
      blob_types = ["blockBlob"]
    }
    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = 365
      }
    }
  }
}
