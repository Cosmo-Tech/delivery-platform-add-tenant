# 1. Create resources ###

If you want to use the backend remote option of Terraform, the Storage account must exists before launching tenant creation

## 1.1. First export mandatory environment variables
```bash
export TF_VAR_tf_resource_group_name="changeme"
export TF_VAR_tf_storage_account_name="changeme"
export TF_VAR_tf_container_name="changeme"
export TF_VAR_tf_blob_name="changeme"
export TF_VAR_tf_access_key="changeme"
```

## 1.2. Some vars need to be filled in terraform.tfvars config file if we want to fill Vault with Platform values
```terraform
create_vault_entries = true
vault_addr           = "changeme" # The URL of the deployed Vault
vault_token          = "changeme" # The token used to log into the Vault
```

## 1.3. We can now initiate terraform repo with previously created vars
```bash
terraform init \
    -backend-config "resource_group_name=$TF_VAR_tf_resource_group_name" \
    -backend-config "storage_account_name=$TF_VAR_tf_storage_account_name" \
    -backend-config "container_name=$TF_VAR_tf_container_name" \
    -backend-config "key=$TF_VAR_tf_blob_name" \
    -backend-config "access_key=$TF_VAR_tf_access_key"
```

## 1.4. Create plan
```bash
terraform plan -out tfplan
```

## 1.5. Apply plan
```bash
terraform apply tfplan
```

- Once the tenant deployed, grant admin consent for the 'platform's tenant' app registration
- Add users / group in service principal associated to this app registration
- Add permission to the Platform's tenant app registration on herself and grant admin consent too

Enjoy !


# 2. Destroy resources ###

## 2.1. Before terraform destroy 'tenant'
## 2.2. In order to keep Argo CRDS, we remove them from tfstate
```bash
terraform state rm "module.platform-tenant-resources.module.create-argo.kubectl_manifest.argo_crds"
```

## 2.3. And then destroy resources
```bash
terraform destroy
```


# 3. I don't want to use the Terraform backend remote option ###

Comment the backend_remote option in providers (providers.tf) definition file like this:

```tf
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.54.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.38.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
  # backend "azurerm" {
  # }
  required_version = ">= 1.3.9"
}
```
