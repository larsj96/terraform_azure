# https://learn.microsoft.com/en-us/azure/dns/dns-get-started-terraform?tabs=azure-cli


#azure.lanilsen.xyz -> lanilsen.xyz er styrt av cloudfare

resource "azurerm_dns_zone" "azure_lanilsen_xyz" {
  name                = "azure.lanilsen.xyz"
  resource_group_name = azurerm_resource_group.resource_group["common"].name
}