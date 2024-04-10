
output "azure_lanilsen_xyz_ns" {
  value = azurerm_dns_zone.azure_lanilsen_xyz.name_servers
}


output "azurerm_static_web_app_api_keys" {
  value = { for k, app in azurerm_static_web_app.static_web_app : k => app.api_key }
  sensitive = true
}
