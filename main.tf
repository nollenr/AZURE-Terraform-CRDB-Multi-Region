locals {
  required_tags = {
    owner       = var.owner,
  }
  tags = merge(var.resource_tags, local.required_tags)
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.owner}-${var.resource_name}-rg"
  location = var.resource_group_location
  tags     = local.tags
}

