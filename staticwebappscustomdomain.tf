# 
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_web_app_custom_domain
# resource "azurerm_static_web_app_custom_domain" "example" {
#   static_web_app_id = azurerm_static_web_app.example.id
#   domain_name       = "${azurerm_dns_cname_record.example.name}.${azurerm_dns_cname_record.example.zone_name}"
#   validation_type   = "cname-delegation"
# }