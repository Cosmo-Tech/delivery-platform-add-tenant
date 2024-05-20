data "terraform_remote_state" "state" {
  count   = var.backend_remote ? 1 : 0
  backend = "azurerm"
  config = {
    resource_group_name  = var.tf_resource_group_name
    storage_account_name = var.tf_storage_account_name
    container_name       = var.tf_container_name
    key                  = var.tf_blob_name_tenant
    access_key           = var.tf_access_key
  }
}

module "cosmotech-tenant" {
  source  = "Cosmo-Tech/cosmotech-tenant/azure"
  version = "1.2.2"

  # Azure tenant prerequisites
  tenant_id                              = var.tenant_id
  client_id                              = var.client_id
  client_secret                          = var.client_secret
  platform_url                           = var.platform_url
  identifier_uri                         = var.identifier_uri
  project_stage                          = var.project_stage
  project_name                           = var.project_name
  owner_list                             = var.owner_list
  audience                               = var.audience
  webapp_url                             = var.webapp_url
  location                               = var.location
  tenant_resource_group                  = var.tenant_resource_group
  common_resource_group                  = var.common_resource_group
  dns_record                             = var.dns_record
  dns_zone_name                          = var.dns_zone_name
  dns_zone_rg                            = var.dns_zone_rg
  api_version_path                       = var.api_version_path
  customer_name                          = var.customer_name
  user_app_role                          = var.user_app_role
  image_path                             = var.image_path
  create_restish                         = var.create_restish
  create_powerbi                         = var.create_powerbi
  create_secrets                         = var.create_secrets
  create_webapp                          = var.create_webapp
  create_babylon                         = var.create_babylon
  cost_center                            = var.cost_center
  publicip_resource_group                = var.publicip_resource_group
  vnet_name                              = var.vnet_name
  public_ip_name                         = var.public_ip_name
  kubernetes_azurefile_storage_tags      = var.kubernetes_azurefile_storage_tags
  kubernetes_azurefile_storage_class_sku = var.kubernetes_azurefile_storage_class_sku


  # Azure tenant resources
  deployment_type                              = var.deployment_type
  subscription_id                              = var.subscription_id
  tenant_virtual_network_address_prefix        = var.tenant_virtual_network_address_prefix
  tenant_virtual_subnet_network_address_prefix = var.tenant_virtual_subnet_network_address_prefix
  managed_disk_name                            = var.managed_disk_name
  cluster_name                                 = var.cluster_name
  network_sp_object_id                         = var.network_sp_object_id
  storage_kind                                 = var.storage_kind
  vnet_resource_group                          = var.vnet_resource_group
  create_backup                                = var.create_backup
  create_cosmosdb                              = var.create_cosmosdb
  create_adx                                   = var.create_adx
  create_eventhub                              = var.create_eventhub
  common_platform_object_id                    = var.common_platform_object_id

  blob_privatedns_zonename     = var.blob_privatedns_zonename
  queue_privatedns_zonename    = var.queue_privatedns_zonename
  table_privatedns_zonename    = var.table_privatedns_zonename
  eventhub_privatedns_zonename = var.eventhub_privatedns_zonename
  adt_privatedns_zonename      = var.adt_privatedns_zonename

  redis_disk_tier     = var.redis_disk_tier
  redis_disk_sku      = var.redis_disk_sku
  redis_disk_size_gb  = var.redis_disk_size_gb
  kusto_instance_type = var.kusto_instance_type
  kustonr_instances   = var.kustonr_instances
  auto_stop_kusto     = var.auto_stop_kusto
  tenant_group_id     = var.tenant_group_id
  tenant_sp_object_id = var.tenant_sp_object_id

  # Vault entries
  create_vault_entries        = var.create_vault_entries
  kubernetes_tenant_namespace = var.kubernetes_tenant_namespace
  platform_name               = var.platform_name
  organization_name           = var.organization_name
  vault_addr                  = var.vault_addr
  vault_token                 = var.vault_token
  tf_resource_group_name      = var.tf_resource_group_name
  tf_storage_account_name     = var.tf_storage_account_name
  tf_container_name           = var.tf_container_name
  tf_blob_name_tenant         = var.tf_blob_name_tenant
  tf_access_key               = var.tf_access_key

  # Platform tenant resources
  api_dns_name                       = var.api_dns_name
  api_replicas                       = var.api_replicas
  tls_certificate_type               = var.tls_certificate_type
  tls_certificate_custom_certificate = var.tls_certificate_custom_certificate
  tls_certificate_custom_key         = var.tls_certificate_custom_key
  monitoring_enabled                 = var.monitoring_enabled
  monitoring_namespace               = var.monitoring_namespace
  chart_package_version              = var.chart_package_version
  redis_disk_name                    = var.redis_disk_name
  redis_port                         = var.redis_port
  argo_minio_persistence_size        = var.argo_minio_persistence_size
  argo_minio_requests_memory         = var.argo_minio_requests_memory
  archive_ttl                        = var.archive_ttl
  cluster_issuer_name                = var.cluster_issuer_name
  cosmotech_api_version              = var.cosmotech_api_version
  cosmotech_api_ingress_enabled      = var.cosmotech_api_ingress_enabled
  network_client_id                  = var.network_client_id
  network_client_secret              = var.network_client_secret
  tenant_client_id                   = var.tenant_client_id
  tenant_client_secret               = var.tenant_client_secret
  create_rabbitmq                    = var.create_rabbitmq
  list_apikey_allowed                = var.list_apikey_allowed
}
