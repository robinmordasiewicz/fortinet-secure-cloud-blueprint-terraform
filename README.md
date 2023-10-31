# terraform-docs

Azure Automation Fortinet Terraform.

[![MegaLinter](https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform/actions/workflows/mega-linter.yml/badge.svg)](https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform/actions/workflows/mega-linter.yml)

[![FortiDevSec SAST scanner](https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform/actions/workflows/sast.yml/badge.svg)](https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform/actions/workflows/sast.yml)

```bash
git config --global init.templateDir ~/.git-template
pre-commit init-templatedir ~/.git-template
git clone https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform
```

```bash
export TF_CLI_ARGS_init="-backend-config=backend.hcl"
terraform output -raw admin_password
terraform output -raw tls_private_key
```

```bash
git checkout main
git pull
git checkout <local-branch>
git merge main
```

```bash
gh workflow run environment.yml --ref Production -R robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform
```

```bash
trivy fs --scanners vuln,config .
```

## Install megalinter

```bash
npm install mega-linter-runner -g
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name                                                                      | Version |
|---------------------------------------------------------------------------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.5.7   |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | 3.77.0  |
| <a name="requirement_random"></a> [random](#requirement\_random)          | 3.5.1   |
| <a name="requirement_tls"></a> [tls](#requirement\_tls)                   | 4.0.4   |

## Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.77.0  |
| <a name="provider_random"></a> [random](#provider\_random)    | 3.5.1   |
| <a name="provider_tls"></a> [tls](#provider\_tls)             | 4.0.4   |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                                       | Type        |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| [azurerm_availability_set.fortinet_availability_set](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/availability_set)                                                     | resource    |
| [azurerm_disk_encryption_set.en_set](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/disk_encryption_set)                                                                  | resource    |
| [azurerm_key_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/key_vault)                                                                                       | resource    |
| [azurerm_key_vault_access_policy.kv_access_policy_des](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/key_vault_access_policy)                                            | resource    |
| [azurerm_key_vault_key.key](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/key_vault_key)                                                                                 | resource    |
| [azurerm_linux_virtual_machine.fortigate_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/linux_virtual_machine)                                           | resource    |
| [azurerm_linux_virtual_machine.fortiweb_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/linux_virtual_machine)                                            | resource    |
| [azurerm_linux_virtual_machine.ubuntu_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/linux_virtual_machine)                                              | resource    |
| [azurerm_managed_disk.fortiweb_log_disk](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/managed_disk)                                                                     | resource    |
| [azurerm_monitor_diagnostic_setting.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/monitor_diagnostic_setting)                                                   | resource    |
| [azurerm_network_ddos_protection_plan.ddos_protection_plan](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_ddos_protection_plan)                                  | resource    |
| [azurerm_network_interface.fortigate_dmz_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_interface)                                             | resource    |
| [azurerm_network_interface.fortigate_external_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_interface)                                        | resource    |
| [azurerm_network_interface.fortiweb_dmz_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_interface)                                              | resource    |
| [azurerm_network_interface.fortiweb_internal_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_interface)                                         | resource    |
| [azurerm_network_interface.ubuntu_dmz_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_interface)                                                | resource    |
| [azurerm_network_interface.ubuntu_internal_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_interface)                                           | resource    |
| [azurerm_network_interface_security_group_association.fortigate_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_interface_security_group_association) | resource    |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_security_group)                                                               | resource    |
| [azurerm_network_security_group.private_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_security_group)                                                       | resource    |
| [azurerm_network_security_group.vip_allow_https_tcp_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/network_security_group)                                           | resource    |
| [azurerm_public_ip.vip_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/public_ip)                                                                               | resource    |
| [azurerm_subnet.dmz_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/subnet)                                                                                        | resource    |
| [azurerm_subnet.external_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/subnet)                                                                                   | resource    |
| [azurerm_subnet.internal_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/subnet)                                                                                   | resource    |
| [azurerm_subnet_network_security_group_association.dmz_subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/subnet_network_security_group_association)      | resource    |
| [azurerm_subnet_network_security_group_association.external_subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/subnet_network_security_group_association) | resource    |
| [azurerm_subnet_network_security_group_association.internal_subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/subnet_network_security_group_association) | resource    |
| [azurerm_virtual_machine_data_disk_attachment.fortiweb_data_disk_attachment](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/virtual_machine_data_disk_attachment)         | resource    |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/resources/virtual_network)                                                                            | resource    |
| [random_pet.admin_username](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/pet)                                                                                             | resource    |
| [random_string.azurerm_key_vault_key_name](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/string)                                                                           | resource    |
| [random_string.azurerm_key_vault_name](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/string)                                                                               | resource    |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key)                                                                                          | resource    |
| [azurerm_public_ip.vip_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/data-sources/public_ip)                                                                            | data source |
| [azurerm_resource_group.AZURE_RESOURCE_GROUP](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/data-sources/resource_group)                                                           | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.77.0/docs/data-sources/subscription)                                                                            | data source |

## Inputs

| Name                                                                                                                         | Description                                                                             | Type           | Default                                                                                                                                                                  | Required |
|------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
| <a name="input_ARM_TENANT_ID"></a> [ARM\_TENANT\_ID](#input\_ARM\_TENANT\_ID)                                                | Azure Tenant ID                                                                         | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_AZURE_RESOURCE_GROUP_NAME"></a> [AZURE\_RESOURCE\_GROUP\_NAME](#input\_AZURE\_RESOURCE\_GROUP\_NAME)          | Name of the resource group.                                                             | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_AZURE_SERVICE_PRINCIPAL_UUID"></a> [AZURE\_SERVICE\_PRINCIPAL\_UUID](#input\_AZURE\_SERVICE\_PRINCIPAL\_UUID) | Azure service principal UUID                                                            | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_AZURE_STORAGE_ACCOUNT_ID"></a> [AZURE\_STORAGE\_ACCOUNT\_ID](#input\_AZURE\_STORAGE\_ACCOUNT\_ID)             | ID of the Azure storage account.                                                        | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_dmz-Name"></a> [dmz-Name](#input\_dmz-Name)                                                                   | DMZ Subnet Name.                                                                        | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_dmz-Prefix"></a> [dmz-Prefix](#input\_dmz-Prefix)                                                             | DMZ Subnet Prefix.                                                                      | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_external-Name"></a> [external-Name](#input\_external-Name)                                                    | External Subnet Name.                                                                   | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_external-Prefix"></a> [external-Prefix](#input\_external-Prefix)                                              | External Subnet Prefix.                                                                 | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_internal-Name"></a> [internal-Name](#input\_internal-Name)                                                    | Internal Subnet Name.                                                                   | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_internal-Prefix"></a> [internal-Prefix](#input\_internal-Prefix)                                              | Internal Subnet Prefix.                                                                 | `string`       | n/a                                                                                                                                                                      |   yes    |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name)                                                                 | The name of the key to be created. The value will be randomly generated if blank.       | `string`       | `""`                                                                                                                                                                     |    no    |
| <a name="input_key_opts"></a> [key\_opts](#input\_key\_opts)                                                                 | The permitted JSON web key operations of the key to be created.                         | `list(string)` | <pre>[<br>  "decrypt",<br>  "encrypt",<br>  "sign",<br>  "unwrapKey",<br>  "verify",<br>  "wrapKey"<br>]</pre>                                                           |    no    |
| <a name="input_key_permissions"></a> [key\_permissions](#input\_key\_permissions)                                            | List of key permissions.                                                                | `list(string)` | <pre>[<br>  "List",<br>  "Create",<br>  "Delete",<br>  "Get",<br>  "Purge",<br>  "Recover",<br>  "Update",<br>  "GetRotationPolicy",<br>  "SetRotationPolicy"<br>]</pre> |    no    |
| <a name="input_key_size"></a> [key\_size](#input\_key\_size)                                                                 | The size in bits of the key to be created.                                              | `number`       | `2048`                                                                                                                                                                   |    no    |
| <a name="input_key_type"></a> [key\_type](#input\_key\_type)                                                                 | The JsonWebKeyType of the key to be created.                                            | `string`       | `"RSA"`                                                                                                                                                                  |    no    |
| <a name="input_secret_permissions"></a> [secret\_permissions](#input\_secret\_permissions)                                   | List of secret permissions.                                                             | `list(string)` | <pre>[<br>  "Set"<br>]</pre>                                                                                                                                             |    no    |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name)                                                                 | The SKU of the vault to be created.                                                     | `string`       | `"premium"`                                                                                                                                                              |    no    |
| <a name="input_storage_permissions"></a> [storage\_permissions](#input\_storage\_permissions)                                | List of secret permissions.                                                             | `list(string)` | <pre>[<br>  "Get"<br>]</pre>                                                                                                                                             |    no    |
| <a name="input_vault_name"></a> [vault\_name](#input\_vault\_name)                                                           | The name of the key vault to be created. The value will be randomly generated if blank. | `string`       | `""`                                                                                                                                                                     |    no    |
| <a name="input_vnetAddressPrefix"></a> [vnetAddressPrefix](#input\_vnetAddressPrefix)                                        | Virtual Network Address prefix.                                                         | `string`       | n/a                                                                                                                                                                      |   yes    |

## Outputs

| Name                                                                                                                           | Description                                      |
|--------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username)                                               | Username for admin account                       |
| <a name="output_availabilitySetFdc"></a> [availabilitySetFdc](#output\_availabilitySetFdc)                                     | Number of fault domains in the availability set. |
| <a name="output_availabilitySetId"></a> [availabilitySetId](#output\_availabilitySetId)                                        | ID of the Azure availability set.                |
| <a name="output_availabilitySetName"></a> [availabilitySetName](#output\_availabilitySetName)                                  | Name of the Azure availability set.              |
| <a name="output_azurerm_key_vault_id"></a> [azurerm\_key\_vault\_id](#output\_azurerm\_key\_vault\_id)                         | ID of the Azure key vault                        |
| <a name="output_azurerm_key_vault_name"></a> [azurerm\_key\_vault\_name](#output\_azurerm\_key\_vault\_name)                   | Name of the Azure key vault                      |
| <a name="output_currentSubscriptionDisplayName"></a> [currentSubscriptionDisplayName](#output\_currentSubscriptionDisplayName) | Azure subscription Name                          |
| <a name="output_currentSubscriptionId"></a> [currentSubscriptionId](#output\_currentSubscriptionId)                            | Azure subscription ID                            |
| <a name="output_resourceGroupName"></a> [resourceGroupName](#output\_resourceGroupName)                                        | Azure resource group for all objects             |
| <a name="output_tls_private_key"></a> [tls\_private\_key](#output\_tls\_private\_key)                                          | TSL private key                                  |
| <a name="output_ubuntuVmName"></a> [ubuntuVmName](#output\_ubuntuVmName)                                                       | Ubuntu machine name.                             |
| <a name="output_vip_public_ip_address"></a> [vip\_public\_ip\_address](#output\_vip\_public\_ip\_address)                      | Public IP address                                |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Example terraform.auto.tfvars

```hcl
vnetAddressPrefix = "10.0.0.0/16"
external-Name     = "external"
external-Prefix   = "10.0.1.0/24"
dmz-Name          = "dmz"
dmz-Prefix        = "10.0.2.0/24"
internal-Name     = "internal"
internal-Prefix   = "10.0.3.0/24"
```
<!-- markdownlint-disable -->

## Documentation
<!-- markdownlint-disable MD033 -->
## Requirements

| Name      | Version |
|-----------|---------|
| terraform | 1.6.2   |
| azurerm   | 3.78.0  |
| http      | 3.4.0   |
| random    | 3.5.1   |
| tls       | 4.0.4   |
<!-- markdownlint-disable MD013 -->
<!-- markdownlint-disable MD034 -->
## Inputs

| Name                         | Description                     | Type     | Default | Required |
|------------------------------|---------------------------------|----------|---------|:--------:|
| AZURE\_RESOURCE\_GROUP\_NAME | Name of the resource group.     | `string` | n/a     |   yes    |
| dmz-Name                     | DMZ Subnet Name.                | `string` | n/a     |   yes    |
| dmz-Prefix                   | DMZ Subnet Prefix.              | `string` | n/a     |   yes    |
| external-Name                | External Subnet Name.           | `string` | n/a     |   yes    |
| external-Prefix              | External Subnet Prefix.         | `string` | n/a     |   yes    |
| internal-Name                | Internal Subnet Name.           | `string` | n/a     |   yes    |
| internal-Prefix              | Internal Subnet Prefix.         | `string` | n/a     |   yes    |
| vnetAddressPrefix            | Virtual Network Address prefix. | `string` | n/a     |   yes    |
## Resources

| Name                                                                                                                                                                                                       | Type        |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| [azurerm_availability_set.fortinet_availability_set](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/availability_set)                                                     | resource    |
| [azurerm_linux_virtual_machine.fortigate_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/linux_virtual_machine)                                           | resource    |
| [azurerm_linux_virtual_machine.fortiweb_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/linux_virtual_machine)                                            | resource    |
| [azurerm_linux_virtual_machine.ubuntu_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/linux_virtual_machine)                                              | resource    |
| [azurerm_managed_disk.fortiweb_log_disk](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/managed_disk)                                                                     | resource    |
| [azurerm_network_ddos_protection_plan.ddos_protection_plan](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_ddos_protection_plan)                                  | resource    |
| [azurerm_network_interface.fortigate_dmz_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_interface)                                             | resource    |
| [azurerm_network_interface.fortigate_external_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_interface)                                        | resource    |
| [azurerm_network_interface.fortiweb_dmz_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_interface)                                              | resource    |
| [azurerm_network_interface.fortiweb_internal_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_interface)                                         | resource    |
| [azurerm_network_interface.ubuntu_dmz_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_interface)                                                | resource    |
| [azurerm_network_interface.ubuntu_internal_network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_interface)                                           | resource    |
| [azurerm_network_interface_security_group_association.fortigate_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_interface_security_group_association) | resource    |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_security_group)                                                               | resource    |
| [azurerm_network_security_group.private_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_security_group)                                                       | resource    |
| [azurerm_network_security_group.vip_allow_https_tcp_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/network_security_group)                                           | resource    |
| [azurerm_public_ip.vip_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/public_ip)                                                                               | resource    |
| [azurerm_subnet.dmz_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/subnet)                                                                                        | resource    |
| [azurerm_subnet.external_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/subnet)                                                                                   | resource    |
| [azurerm_subnet.internal_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/subnet)                                                                                   | resource    |
| [azurerm_subnet_network_security_group_association.dmz_subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/subnet_network_security_group_association)      | resource    |
| [azurerm_subnet_network_security_group_association.external_subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/subnet_network_security_group_association) | resource    |
| [azurerm_subnet_network_security_group_association.internal_subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/subnet_network_security_group_association) | resource    |
| [azurerm_virtual_machine_data_disk_attachment.fortiweb_data_disk_attachment](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/virtual_machine_data_disk_attachment)         | resource    |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/resources/virtual_network)                                                                            | resource    |
| [random_pet.admin_username](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/pet)                                                                                             | resource    |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key)                                                                                          | resource    |
| [azurerm_public_ip.vip_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/data-sources/public_ip)                                                                            | data source |
| [azurerm_resource_group.AZURE_RESOURCE_GROUP](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/data-sources/resource_group)                                                           | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/data-sources/subscription)                                                                            | data source |
| [http_http.terraform](https://registry.terraform.io/providers/hashicorp/http/3.4.0/docs/data-sources/http)                                                                                                 | data source |
## Outputs

| Name                           | Description                                      |
|--------------------------------|--------------------------------------------------|
| admin\_username                | Username for admin account                       |
| availabilitySetFdc             | Number of fault domains in the availability set. |
| availabilitySetId              | ID of the Azure availability set.                |
| availabilitySetName            | Name of the Azure availability set.              |
| currentSubscriptionDisplayName | Azure subscription Name                          |
| currentSubscriptionId          | Azure subscription ID                            |
| resourceGroupName              | Azure resource group for all objects             |
| terraform\_version             | Terraform Version                                |
| tls\_private\_key              | TSL private key                                  |
| ubuntuVmName                   | Ubuntu machine name.                             |
| vip\_public\_ip\_address       | Public IP address                                |
<!-- markdownlint-enable -->

<!-- END_TF_DOCS -->
