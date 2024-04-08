


run "Auditing_log_analytics" {
  command = plan

  assert {
    condition     = azurerm_log_analytics_workspace.Auditing-workspace.retention_in_days == 365
    error_message = "The 'Auditing workspaces (log_analytics)' retention in days does not match the expected days (365)."
  }
}