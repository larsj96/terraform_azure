resource "azurerm_static_web_app" "static_web_app" {
  for_each = { for k, v in azurerm_resource_group.resource_group : k => v if k != "common" } # Exclude 'common' resource group

  name                = "Website-mkdocs-${each.key}" # Ensures the name is unique
  resource_group_name = azurerm_resource_group.resource_group[each.key].name
  location            = "westeurope" #azurerm_resource_group.resource_group[each.key].location - norwayeast not supported :(
  tags                = azurerm_resource_group.resource_group[each.key].tags

  sku_tier   = "Free" #Standard


 # identities cannot be used with the Free tier of Static Web Apps
  #   identity {
  #   type = "SystemAssigned"
  # }

}




# Error: creating Static Site (Subscription: "87f28a4d-08ed-49ea-a432-a07656c1ac9d" Resource Group Name: "test-resource-group" Static Site Name: "Website-mkdocs-test"): performing CreateOrUpdateStaticSite: unexpected status 400 (400 Bad Request) 
#with error: LocationNotAvailableForResourceType: The provided location 'norwayeast' is not available for resource type 'Microsoft.Web/staticSites'. List of available regions for the resource type is 'westus2,centralus,eastus2,westeurope,eastasia'.
# with azurerm_static_web_app.static_web_app["test"]
# on staticwebapps.tf line 1, in resource "azurerm_static_web_app" "static_web_app":