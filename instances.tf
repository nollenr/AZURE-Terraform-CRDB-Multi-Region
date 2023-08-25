module "crdb-region-0" {
  # use the https clone url from github, but without the "https://"
  source = "github.com/nollenr/AZURE-Terraform-CRDB-Module.git"

  owner = var.owner
  resource_name                = "${var.resource_name}-zone0"
  multi_region                 = var.multi_region
  multi_region_resource_group_name = azurerm_resource_group.rg.name
  my_ip_address                = var.my_ip_address
  # resource_group_location this is the location of the resource group holding the metadata.  Not needed to be passed in since I'll be passing in the name of the resource group
  azure_ssh_key_name           = var.azure_ssh_key_name
  azure_ssh_key_resource_group = var.azure_ssh_key_resource_group
  virtual_network_cidr         = var.virtual_network_cidr_blocks[0]
  virtual_network_location     = var.virtual_network_locations[0]
  crdb_vm_size                 = var.crdb_vm_size
  crdb_disk_size               = var.crdb_disk_size
  crdb_resize_homelv           = var.crdb_resize_homelv
  create_admin_user            = var.create_admin_user
  admin_user_name              = var.admin_user_name
  crdb_version                 = var.crdb_version
  install_enterprise_keys      = var.install_enterprise_keys
  include_ha_proxy             = var.include_ha_proxy
  haproxy_vm_size              = var.haproxy_vm_size
  include_app                  = var.include_app
  app_vm_size                  = var.app_vm_size
  install_system_location_data = var.install_system_location_data

  tls_private_key              = local.tls_private_key
  tls_public_key               = local.tls_public_key
  tls_cert                     = local.tls_cert
  tls_user_cert                = local.tls_user_cert
  tls_user_key                 = local.tls_user_key

  cluster_organization         = var.cluster_organization
  enterprise_license           = var.enterprise_license
}

module "crdb-region-1" {
  # use the https clone url from github, but without the "https://"
  source = "github.com/nollenr/AZURE-Terraform-CRDB-Module.git"

  join_string                  = module.crdb-region-0.join_string     # from 1st module
  run_init                     = "no"                                 # no for all except the 1st
  create_admin_user            = "no"                                 # no for all except the 1st

  virtual_network_cidr         = var.virtual_network_cidr_blocks[1]  # different for each module
  virtual_network_location     = var.virtual_network_locations[1]    # different for each module


  owner                        = var.owner                            # same for all
  resource_name                = "${var.resource_name}-zone1"         # different for each module
  multi_region                 = var.multi_region                     # same for all
  multi_region_resource_group_name = azurerm_resource_group.rg.name   # same for all
  my_ip_address                = var.my_ip_address                    # same for all
  # resource_group_location this is the location of the resource group holding the metadata.  Not needed to be passed in since I'll be passing in the name of the resource group
  azure_ssh_key_name           = var.azure_ssh_key_name               # same for all
  azure_ssh_key_resource_group = var.azure_ssh_key_resource_group     # same for all
  crdb_vm_size                 = var.crdb_vm_size                     # same for all
  crdb_disk_size               = var.crdb_disk_size                   # same for all
  crdb_resize_homelv           = var.crdb_resize_homelv               # same for all
  admin_user_name              = var.admin_user_name                  # not needed
  crdb_version                 = var.crdb_version                     # same for all
  install_enterprise_keys      = "no"                                 # no for all except the 1st
  include_ha_proxy             = var.include_ha_proxy                 # same for all
  haproxy_vm_size              = var.haproxy_vm_size                  # same for all
  include_app                  = var.include_app                      # same for all
  app_vm_size                  = var.app_vm_size                      # same for all
  install_system_location_data = "no"                                 # no for all except the 1st

  tls_private_key              = local.tls_private_key                # same for all
  tls_public_key               = local.tls_public_key                 # same for all
  tls_cert                     = local.tls_cert                       # same for all
  tls_user_cert                = local.tls_user_cert                  # same for all
  tls_user_key                 = local.tls_user_key                   # same for all

  cluster_organization         = var.cluster_organization             # not needed except for the 1st
  enterprise_license           = var.enterprise_license               # not needed except for the 1st
}

module "crdb-region-2" {
  # use the https clone url from github, but without the "https://"
  source = "github.com/nollenr/AZURE-Terraform-CRDB-Module.git"

  join_string                  = module.crdb-region-0.join_string     # from 1st module
  run_init                     = "no"                                 # no for all except the 1st
  create_admin_user            = "no"                                 # no for all except the 1st

  virtual_network_cidr         = var.virtual_network_cidr_blocks[2]  # different for each module
  virtual_network_location     = var.virtual_network_locations[2]    # different for each module


  owner                        = var.owner                            # same for all
  resource_name                = "${var.resource_name}-zone2"         # different for each module
  multi_region                 = var.multi_region                     # same for all
  multi_region_resource_group_name = azurerm_resource_group.rg.name   # same for all
  my_ip_address                = var.my_ip_address                    # same for all
  # resource_group_location this is the location of the resource group holding the metadata.  Not needed to be passed in since I'll be passing in the name of the resource group
  azure_ssh_key_name           = var.azure_ssh_key_name               # same for all
  azure_ssh_key_resource_group = var.azure_ssh_key_resource_group     # same for all
  crdb_vm_size                 = var.crdb_vm_size                     # same for all
  crdb_disk_size               = var.crdb_disk_size                   # same for all
  crdb_resize_homelv           = var.crdb_resize_homelv               # same for all
  admin_user_name              = var.admin_user_name                  # not needed
  crdb_version                 = var.crdb_version                     # same for all
  install_enterprise_keys      = "no"                                 # no for all except the 1st
  include_ha_proxy             = var.include_ha_proxy                 # same for all
  haproxy_vm_size              = var.haproxy_vm_size                  # same for all
  include_app                  = var.include_app                      # same for all
  app_vm_size                  = var.app_vm_size                      # same for all
  install_system_location_data = "no"                                 # no for all except the 1st

  tls_private_key              = local.tls_private_key                # same for all
  tls_public_key               = local.tls_public_key                 # same for all
  tls_cert                     = local.tls_cert                       # same for all
  tls_user_cert                = local.tls_user_cert                  # same for all
  tls_user_key                 = local.tls_user_key                   # same for all

  cluster_organization         = var.cluster_organization             # not needed except for the 1st
  enterprise_license           = var.enterprise_license               # not needed except for the 1st
}

resource "azurerm_virtual_network_peering" "zone0-to-zone1" {
  allow_gateway_transit        = false # must be false for global peering
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  resource_group_name          = azurerm_resource_group.rg.name
  name                         = "${var.owner}-${var.resource_name}-peering-${var.virtual_network_locations[0]}-to-${var.virtual_network_locations[1]}"
  virtual_network_name         = module.crdb-region-0.virtual_network_name
  remote_virtual_network_id    = module.crdb-region-1.virtual_network_id
}
resource "azurerm_virtual_network_peering" "zone1-to-zone0" {
  allow_gateway_transit        = false # must be false for global peering
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  resource_group_name          = azurerm_resource_group.rg.name
  name                         = "${var.owner}-${var.resource_name}-peering--${var.virtual_network_locations[1]}-to-${var.virtual_network_locations[0]}"
  virtual_network_name         = module.crdb-region-1.virtual_network_name
  remote_virtual_network_id    = module.crdb-region-0.virtual_network_id
}
resource "azurerm_virtual_network_peering" "zone0-to-zone2" {
  allow_gateway_transit        = false # must be false for global peering
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  resource_group_name          = azurerm_resource_group.rg.name
  name                         = "${var.owner}-${var.resource_name}-peering-${var.virtual_network_locations[0]}-to-${var.virtual_network_locations[2]}"
  virtual_network_name         = module.crdb-region-0.virtual_network_name
  remote_virtual_network_id    = module.crdb-region-2.virtual_network_id
}
resource "azurerm_virtual_network_peering" "zone2-to-zone0" {
  allow_gateway_transit        = false # must be false for global peering
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  resource_group_name          = azurerm_resource_group.rg.name
  name                         = "${var.owner}-${var.resource_name}-peering-${var.virtual_network_locations[2]}-to-${var.virtual_network_locations[0]}"
  virtual_network_name         = module.crdb-region-2.virtual_network_name
  remote_virtual_network_id    = module.crdb-region-0.virtual_network_id
}
resource "azurerm_virtual_network_peering" "zone1-to-zone2" {
  allow_gateway_transit        = false # must be false for global peering
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  resource_group_name          = azurerm_resource_group.rg.name
  name                         = "${var.owner}-${var.resource_name}-peering-${var.virtual_network_locations[1]}-to-${var.virtual_network_locations[2]}"
  virtual_network_name         = module.crdb-region-1.virtual_network_name
  remote_virtual_network_id    = module.crdb-region-2.virtual_network_id
}
resource "azurerm_virtual_network_peering" "zone2-to-zone1" {
  allow_gateway_transit        = false # must be false for global peering
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  resource_group_name          = azurerm_resource_group.rg.name
  name                         = "${var.owner}-${var.resource_name}-peering-${var.virtual_network_locations[2]}-to-${var.virtual_network_locations[1]}"
  virtual_network_name         = module.crdb-region-2.virtual_network_name
  remote_virtual_network_id    = module.crdb-region-1.virtual_network_id
}