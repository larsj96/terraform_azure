# https://developer.hashicorp.com/terraform/language/tests

# look here for some more example: https://www.hashicorp.com/blog/testing-hashicorp-terraform

# https://developer.hashicorp.com/terraform/language/checks
# If a postcondition/ lifecycle block fails, it blocks Terraform from executing the current operation.
# If a check block fails, it does not block Terraform from executing an operation.




variables {
  resource_group_names = {
    prod   = "prod-resource-group"
    test   = "test-resource-group"
    dev    = "dev-resource-group"
    common = "common-resource-group"
  }
  resource_group_locations = {
    prod   = "norwayeast"
    test   = "norwayeast"
    dev    = "westeurope"
    common = "norwayeast"
  }
}

# Test for the "prod" resource group creation
run "prod_resource_group" {
  command = plan

  assert {
    condition     = azurerm_resource_group.resource_group["prod"].name == var.resource_group_names["prod"]
    error_message = "The 'prod' resource group name does not match the expected name."
  }

  assert {
    condition     = azurerm_resource_group.resource_group["prod"].location == var.resource_group_locations["prod"]
    error_message = "The 'prod' resource group location does not match the expected location."
  }
}


# Example for the "dev" environment - this is failing on purpose since location is wrong :-)
run "test_resource_group" {
  command = plan

  assert {
    condition     = azurerm_resource_group.resource_group["dev"].name == var.resource_group_names["dev"]
    error_message = "The 'dev' resource group name does not match the expected name."
  }

  assert {
    condition     = azurerm_resource_group.resource_group["dev"].location == "norwayeast" #
    error_message = "The 'test' resource group location does not match the expected location."
  }
}