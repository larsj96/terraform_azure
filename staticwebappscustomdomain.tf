# 
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app_custom_domain




# Adding Custom domain to all the websites
resource "azurerm_static_web_app_custom_domain" "custom_domain" {
  for_each = azurerm_static_web_app.static_web_app

  static_web_app_id = each.value.id
  domain_name       = "${azurerm_dns_cname_record.web_apps_cname[each.key].name}.${azurerm_dns_zone.azure_lanilsen_xyz.name}"

  validation_type   = "cname-delegation"
}