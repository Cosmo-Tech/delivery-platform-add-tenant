# 1. Choose backend option ###

If you want to use the backend remote option of Terraform, the Storage account must exists before launching platform's tenant creation


## 1.1. Backend remote option

### 1.1.1. First export mandatory environment variables

This values can be found on the Azure portal.

```bash
export TF_VAR_tf_resource_group_name="changeme"
export TF_VAR_tf_storage_account_name="changeme"
export TF_VAR_tf_container_name="changeme"
export TF_VAR_tf_blob_name="changeme"
export TF_VAR_tf_access_key="changeme"
```


### 1.1.2. We can now initiate terraform repo with previously created vars
```bash
terraform init \
    -backend-config "resource_group_name=$TF_VAR_tf_resource_group_name" \
    -backend-config "storage_account_name=$TF_VAR_tf_storage_account_name" \
    -backend-config "container_name=$TF_VAR_tf_container_name" \
    -backend-config "key=$TF_VAR_tf_blob_name" \
    -backend-config "access_key=$TF_VAR_tf_access_key"
```


## 1.2. I don't want to use the Terraform backend remote option

Change the backend_remote option in providers (providers.tf) definition file from 'azurerm' to 'local' value:

```tf
backend "local" {
}
```

Add backend_remote to terraform.tfvars file and set it to false:

```tf
backend_remote = false
```


# 2. Should I use the *create_vault_entries* option ? ###

## 2.1. Prerequisites

A Vault should exists, and you have the URL as well as the acces token.


## 2.2. Fill terraform.tfvars config file with this values

```terraform
create_vault_entries = true
vault_addr           = "changeme" # The URL of the deployed Vault
vault_token          = "changeme" # The token used to log into the Vault
```

Entries will automatically be added at the end of the platform creation into the Vault, in order to be easily retrieved and used later with [Babylon](https://github.com/Cosmo-Tech/Babylon)


# 3. Create resources ###


## 3.1. Add mandatory variables

The module needs at least these values:
```tf
subscription_id = ""
tenant_id       = ""
owner_list      = [""]
project_name    = ""
cluster_name    = ""
platform_vnet   = ""
vnet_iprange    = "10.10.0.0/16"
platform_sp_name        = ""
platform_resource_group = ""
platform_public_ip      = ""
tenant_resource_group   = ""
dns_record              = ""
namespace               = ""
```

Fill the terraform.tfvars file with your values. For explanations, see [below](#5.).

There is a lot of parameters you can add. For a complete list, see the *variables.tf* config files of the current repository.

## 3.2. Create plan
```bash
terraform plan -out tfplan
```

## 3.3. Apply plan
```bash
terraform apply tfplan
```

## 3.4. Grant authorizations to user / app
- Add users / group in service principal associated to this app registration
- Add permission to the Platform's tenant app registration on herself ('Platform.Admin') and grant admin consent

Enjoy !


# 4. Destroy resources ###

## 4.1. Before terraform destroy 'tenant'
In order to keep Argo CRDS, we remove them from tfstate
```bash
terraform state rm "module.platform-tenant-resources.module.create-argo.kubectl_manifest.argo_crds"
```

## 4.2. And then destroy resources
```bash
terraform destroy
```

# 5. What are the mandatory values ? ###

Here, two parts: 
- values coming from the Cosmo Tech Platform common resources you already deployed.
- values specifics to this tenant

## 5.1. Values coming from the Cosmo Tech Platform common resources


These values already exist and come from the common resources of the Cosmo Tech Platform. You can retrieve them through the Azure portal or from the outputs of this [module](https://registry.terraform.io/modules/Cosmo-Tech/cosmotech-common/azure/latest)
```tf
subscription_id = ""
tenant_id       = ""
cluster_name    = ""              # The name of the AKS cluster hosting our platform
platform_vnet   = ""              # The cluster's virtual network
platform_sp_name        = ""      # The Platform Service Principal's name
platform_resource_group = ""      # The Platform's resource group
platform_public_ip      = ""      # The Platform public IP
dns_record              = ""      # The DNS record of the Platform
```


## 5.2. Values specifics to this tenant

```tf
owner_list      = [""]
project_name    = ""              # The name of your project
vnet_iprange    = "10.10.0.0/16"  # The IP range of the virtual network we want to build for this tenant. This should be unique through the AKS cluster
tenant_resource_group   = ""      # The Azure resource group that will hold all created resources for this tenant
namespace               = ""      # The Kubernetes namespace for the tenant. Should be the same as the *tenant_resource_group*
```

