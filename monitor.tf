
# make all storage acconts send the logs to the auditing worksapce we created in loganalytics.tf


# `retention_policy` has been deprecated in favor of `azurerm_storage_management_policy` resource - to learn more https://aka.ms/diagnostic_settings_log_retention
# https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/migrate-to-azure-storage-lifecycle-policy?tabs=portal

resource "azurerm_monitor_diagnostic_setting" "storage_account_auditing" {
  for_each            = azurerm_storage_account.storage_account

  name                = "diag-${each.key}"
  target_resource_id  = each.value.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.Auditing-workspace.id


  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}