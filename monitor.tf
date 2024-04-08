
# make all storage acconts send the logs to the auditing worksapce we created in loganalytics.tf
resource "azurerm_monitor_diagnostic_setting" "storage_account_auditing" {
  for_each            = azurerm_storage_account.storage_account

  name                = "diag-${each.key}"
  target_resource_id  = each.value.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.Auditing-workspace.id

  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }

  log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 30
      enabled = true
    }
  }
}
