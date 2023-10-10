subscription_id = ""
tenant_id       = ""
owner_list      = [""]
project_name    = ""
cluster_name    = ""
platform_vnet   = ""
vnet_iprange    = "10.10.0.0/16" # Should be new in each tenant w/o overlapping addresses

platform_sp_name        = ""
platform_resource_group = ""
platform_public_ip      = ""
tenant_resource_group   = ""
dns_record              = ""
namespace               = ""

# Fill Vault with platform values
create_vault_entries = false
vault_addr           = ""
vault_token          = ""