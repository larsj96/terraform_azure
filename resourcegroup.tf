locals {
  common_attributes = {
    location = "norwayeast"
    tags = {
      owner = "Managed by terraform"
    }
  }

  environments = {
    prod = {
      name = "prod-resource-group"
      tags = {
        environment = "prod"
      }
    }
    test = {
      name = "test-resource-group"
      tags = {
        environment = "test"
      }
    }
    dev = {
      name     = "dev-resource-group"
      location = "westeurope", # Override because norway west/east are slow with getting new features to azure
      tags = {
        environment = "dev"
      }
    }
    common = {
      name = "common-resource-group"
      tags = {
        environment = "common"
      }
    }
  }
}

resource "azurerm_resource_group" "resource_group" {
  for_each = local.environments

  name     = each.value.name
  location = lookup(each.value, "location", local.common_attributes.location) # Use environment-specific location if available

  tags = merge(
    local.common_attributes.tags,
    each.value.tags,
  )
}