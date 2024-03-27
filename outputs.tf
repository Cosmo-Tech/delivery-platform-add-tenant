output "out_acr_login_server" {
  value     = module.cosmotech-tenant.out_acr_login_server
  sensitive = true
}

output "out_adx_uri" {
  value = module.cosmotech-tenant.out_adx_uri
}

output "out_cluster_adx_principal_id" {
  value = module.cosmotech-tenant.out_cluster_adx_principal_id
}

output "out_cluster_adx_name" {
  value = module.cosmotech-tenant.out_cluster_adx_name
}

output "out_cosmos_api_url" {
  value = module.cosmotech-tenant.out_cosmos_api_url
}

output "out_cosmos_api_scope" {
  value = module.cosmotech-tenant.out_cosmos_api_scope
}

output "out_cosmos_api_version_path" {
  value = module.cosmotech-tenant.out_cosmos_api_version_path
}

output "out_tenant_resource_group_name" {
  value = module.cosmotech-tenant.out_tenant_resource_group_name
}

output "out_resource_location" {
  value = module.cosmotech-tenant.out_resource_location
}

output "out_storage_account_name" {
  value = module.cosmotech-tenant.out_storage_account_name
}

output "out_storage_account_secret" {
  value     = module.cosmotech-tenant.out_storage_account_secret
  sensitive = true
}

output "out_babylon_client_id" {
  value = module.cosmotech-tenant.out_babylon_client_id
}

output "out_babylon_principal_id" {
  value = module.cosmotech-tenant.out_babylon_principal_id
}

output "out_babylon_client_secret" {
  value     = module.cosmotech-tenant.out_babylon_client_secret
  sensitive = true
}

output "out_tenant_sp_client_id" {
  value = module.cosmotech-tenant.out_tenant_sp_client_id
}

output "out_tenant_sp_object_id" {
  value = module.cosmotech-tenant.out_tenant_sp_object_id
}

output "out_subscription_id" {
  value = module.cosmotech-tenant.out_subscription_id
}
