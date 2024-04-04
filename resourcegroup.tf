
resource "azurerm_resource_group" "resource_group" {
  name     = "test"
  location = "norwayeast"

  tags = {
    environment        = "test"
  }
}