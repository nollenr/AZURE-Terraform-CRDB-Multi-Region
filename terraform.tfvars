# ----------------------------------------
# Globals
# ----------------------------------------
owner                      = "nollen"       #! applied to resources as a tag
resource_name              = "crdb-demo" #! # This is NOT the resource group name, but is used to form the resource group name unless it is passed in as multi-region-resource-group-name
multi_region               = true           #!

# ----------------------------------------
# My IP Address - security group config
# ----------------------------------------
my_ip_address              = "98.148.51.154" #!

# Azure Locations: "australiacentral,australiacentral2,australiaeast,australiasoutheast,brazilsouth,brazilsoutheast,brazilus,canadacentral,canadaeast,centralindia,centralus,centraluseuap,eastasia,eastus,eastus2,eastus2euap,francecentral,francesouth,germanynorth,germanywestcentral,israelcentral,italynorth,japaneast,japanwest,jioindiacentral,jioindiawest,koreacentral,koreasouth,malaysiasouth,northcentralus,northeurope,norwayeast,norwaywest,polandcentral,qatarcentral,southafricanorth,southafricawest,southcentralus,southeastasia,southindia,swedencentral,swedensouth,switzerlandnorth,switzerlandwest,uaecentral,uaenorth,uksouth,ukwest,westcentralus,westeurope,westindia,westus,westus2,westus3,austriaeast,chilecentral,eastusslv,israelnorthwest,malaysiawest,mexicocentral,newzealandnorth,southeastasiafoundational,spaincentral,taiwannorth,taiwannorthwest"
# ----------------------------------------
# Resource Group
# ----------------------------------------
resource_group_location    = "westus2"

# ----------------------------------------
# Existing Key Info
# ----------------------------------------
azure_ssh_key_name           = "nollen-az-kp02" #!
azure_ssh_key_resource_group = "nollen-resource-group"

# ----------------------------------------
# Network
# ----------------------------------------
virtual_network_locations   = ["westus2", "centralus", "eastus2"]
virtual_network_cidr_blocks = ["192.168.5.0/24", "192.168.6.0/24", "192.168.7.0/24"]

# ----------------------------------------
# CRDB Instance Specifications
# Names available here: https://azureprice.net/
# For a 4 vCPU cluster "Standard_D4as_v5", for an ARM Install ""Standard_D2ps_v5" 
# ----------------------------------------
# crdb_vm_size               = "Standard_B1ms"
crdb_vm_size               = "Standard_D4ps_v5"  # arm (Standard_D2ps_v5 and Standard_D4ps_v5 also allows spot pricing)
crdb_store_disk_size        = 64
crdb_nodes                 = 3
crdb_arm_release           = "yes"
crdb_enable_spot_instances = "no"


# ----------------------------------------
# CRDB Admin User - Cert Connection
# ----------------------------------------
create_admin_user          = "yes"
admin_user_name            = "ron"

# ----------------------------------------
# CRDB Specifications
# ----------------------------------------
crdb_version               = "23.2.12"

# ----------------------------------------
# Cluster Enterprise License Keys
# ----------------------------------------
# Be sure to do the following in your environment if you plan on installing the license keys
#   export TF_VAR_cluster_organization='your cluster organization'
#   export TF_VAR_enterprise_license='your enterprise license'
install_enterprise_keys   = "yes"

# ----------------------------------------
# HA Proxy Instance Specifications
# ----------------------------------------
include_ha_proxy           = "yes"
haproxy_vm_size            = "Standard_B1ms"

# ----------------------------------------
# APP Instance Specifications
# ----------------------------------------
include_app                = "yes"
app_vm_size                = "Standard_B1ms"
app_disk_size              = 128
app_resize_homelv          = "yes"  # if the app_disk_size is greater than 64, then set this to "yes" so that the disk will be resized.  See warnings in vars.tf!

# ----------------------------------------
# Cluster Location Data - For console map
# ----------------------------------------
install_system_location_data = "yes"

# ----------------------------------------
# UI Cert (so that the database console does not issue "Your connection is not private" warning)
# ----------------------------------------
include_uicert             = "no"
uicert_domain_name         = ""
uicert_email_address       = ""