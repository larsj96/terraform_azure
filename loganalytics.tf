

# Auditing Workspaces for all azure resources like storage accont, vnet
resource "azurerm_log_analytics_workspace" "Auditing-workspace" {
  name                = "Auditing"  # Choose a unique name for your workspace
  location            = azurerm_resource_group.resource_group["common"].location
  resource_group_name = azurerm_resource_group.resource_group["common"].name
  sku                 = "PerGB2018"  # Choose an appropriate SKU based on your needs

  retention_in_days   = 365  # Set retention as per your requirement

  tags = {
    Environment = "common"
  }
}