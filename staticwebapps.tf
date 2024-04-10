resource "azurerm_static_web_app" "static_web_app" {
  for_each = { for k, v in azurerm_resource_group.resource_group : k => v if k != "common" } # Exclude 'common' resource group

  name                = "Website-mkdocs-${each.key}" # Ensure the name is unique
  resource_group_name = azurerm_resource_group.resource_group[each.key].name
  location            = azurerm_resource_group.resource_group[each.key].location
  tags                = azurerm_resource_group.resource_group[each.key].tags

  sku_tier   = "Standard"

}
