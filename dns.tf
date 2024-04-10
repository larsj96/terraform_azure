# https://learn.microsoft.com/en-us/azure/dns/dns-get-started-terraform?tabs=azure-cli


#azure.lanilsen.xyz -> lanilsen.xyz managed by Terraform on cloudfare

resource "azurerm_dns_zone" "azure_lanilsen_xyz" {
  name                = "azure.lanilsen.xyz"
  resource_group_name = azurerm_resource_group.resource_group["common"].name
}



resource "azurerm_dns_cname_record" "web_apps_cname" {
  for_each = { for key, app in azurerm_static_web_app.static_web_app : key => app.default_host_name }

  name                = each.key  # 'dev', 'prod' and 'test'
  zone_name           = azurerm_dns_zone.azure_lanilsen_xyz.name
  resource_group_name = azurerm_resource_group.resource_group["common"].name
  ttl                 = 3600
  record              = each.value  # Default hostname for the Azure Static Web App

  tags = {
    Environment = "common"
  }
}


# SEE OUTPUTS.TF for nameservers and this for DNS records outside azure -> https://github.com/larsj96/terraform_cloudfare