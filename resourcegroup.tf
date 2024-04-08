locals {
  common_attributes = {
    location = "norwayeast"
    tags = {
      owner = "Managed by terraform"
      GitHubRepo = "https://github.com/larsj96/terraform_azure"
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
      location = "westeurope", # Override because norway west/east are slow with getting new features to azure + also for creating error while creating terraform test files :)
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
  location = lookup(each.value, "location", local.common_attributes.location) # Use environment-specific location if available - otherwise override in the locals above, see dev-resource-group

  tags = merge(
    local.common_attributes.tags,
    each.value.tags,
  )
}