locals {
  required_tags = {
    owner       = var.owner,
  }
  tags = merge(var.resource_tags, local.required_tags)
}

resource "azurerm_resource_group" "rg" {
  # Create this resource only if this is a single region install.  For multi region, the resource group will be passed in.
  name     = "${var.owner}-${var.resource_name}-rg"
  location = var.resource_group_location
  tags     = local.tags
}

