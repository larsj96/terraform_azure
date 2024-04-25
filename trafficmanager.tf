resource "azurerm_traffic_manager_profile" "sftp" {
  name                = "sftp-trafficmanager"
  resource_group_name = azurerm_resource_group.resource_group["prod"].name
  traffic_routing_method      = "Priority"

  dns_config {
    relative_name = "sftp-lanilsen-kamera"
    ttl           = 30
  }

  monitor_config {
    protocol = "TCP"
    port     = 21
  }
}

# resource "azurerm_traffic_manager_endpoint" "on_prem" {
#   name                = "onprem-endpoint"
#   profile_name        = azurerm_traffic_manager_profile.sftp.name
#   resource_group_name = azurerm_resource_group.resource_group["prod"].name
#   type                = "externalEndpoints"
#   priority            = 1
#   target              = "81.166.49.48"
# }

# # This is the IP while the VM are in azure ( Azure site recovery)
# resource "azurerm_traffic_manager_endpoint" "azure_vm" {
#   name                = "azurevm-endpoint"
#   profile_name        = azurerm_traffic_manager_profile.example.name
#   resource_group_name = azurerm_resource_group.resource_group["prod"].name
#   type                = "azureEndpoints"
#   target_resource_id  = azurerm_virtual_machine.example.id
#   priority            = 2
# }

resource "azurerm_traffic_manager_external_endpoint" "onprem" {
  profile_id        = azurerm_traffic_manager_profile.sftp.id
  name              = "sftp"
  target            = "sftp.azure.lanilsen.xyz"
  endpoint_location = "westeurope"
  weight            = 1
}


# resource "azurerm_traffic_manager_azure_endpoint" "on_prem" {
#   name                 = "WAN IP onprem"
#   profile_id           = azurerm_traffic_manager_profile.sftp.id
#   #always_serve_enabled = true
#   weight               = 1
#   target_resource_id   = "WAN IP FOR SFTP IN AZURE WITH SITE RECOVERY"
# }
