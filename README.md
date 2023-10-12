# fortinet-secure-cloud-blueprint-terraform

https://learn.microsoft.com/en-us/azure/active-directory/saas-apps/media/fortigate-ssl-vpn-tutorial/fortigate-deployment-guide-converted?wt.mc_id=searchAPI_azureportal_inproduct_rmskilling&sessionId=87fe3bdc9f7449b6a8189c9250559e3b

https://learn.microsoft.com/en-us/samples/azure-samples/github-terraform-oidc-ci-cd/github-terraform-oidc-ci-cd/

https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure

https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create

https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage

https://github.com/Azure-Samples/terraform-github-actions

https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment#creating-an-environment

https://learn.microsoft.com/en-us/azure/deployment-environments/tutorial-deploy-environments-in-cicd-github

https://github.com/Azure-Samples/terraform-github-actions

https://github.com/Azure-Samples/terraform-github-actions/blob/main/.github/workflows/tf-plan-apply.yml

https://fortinetcloudcse.github.io/FortiDevSec-Workshop/index.html

https://brendanthompson.com/posts/2021/09/getting-started-with-terratest-on-azure

https://brasoe.no/2023/08/30/testing-terraform-code-part-1-2-intro-and-pre-commit-hooks/

https://brasoe.no/2023/08/30/testing-terraform-code-part-2-2-end-to-end-test-terraform/

https://github.com/antonbabenko/pre-commit-terraform

```
export TF_CLI_ARGS_init="-backend-config=backend.hcl"
terraform output -raw admin_password
terraform output -raw tls_private_key
```

```
git checkout main
git pull
git checkout <local-branch>
git merge main
```

```
gh workflow run environment.yml --ref Production -R robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.5.7 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.71.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.5.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.71.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.fortinet-availability-set](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/availability_set) | resource |
| [azurerm_linux_virtual_machine.fortigate-virtual-machine](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.fortiweb-virtual-machine](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.ubuntu-virtual-machine](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_managed_disk.fortiweb-log-disk](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.fortigate-dmz-network-interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.fortigate-external-network-interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.fortiweb-dmz-network-interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.fortiweb-internal-network-interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.ubuntu-dmz-network-interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.ubuntu-internal-network-interface](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.fortigate-association](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.VIP-allow_https_tcp-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.private-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.VIP-public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/public_ip) | resource |
| [azurerm_subnet.dmz-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/subnet) | resource |
| [azurerm_subnet.external-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/subnet) | resource |
| [azurerm_subnet.internal-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.dmz-subnet-association](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.external-subnet-association](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.internal-subnet-association](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_machine_data_disk_attachment.fortiweb-data-disk-attachment](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/resources/virtual_network) | resource |
| [random_password.admin_password](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/password) | resource |
| [random_pet.admin_username](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/pet) | resource |
| [tls_private_key.ssh-key](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
| [azurerm_public_ip.VIP-public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/data-sources/public_ip) | data source |
| [azurerm_resource_group.AZURE_RESOURCE_GROUP](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/data-sources/resource_group) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.71.0/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AZURE_RESOURCE_GROUP_NAME"></a> [AZURE\_RESOURCE\_GROUP\_NAME](#input\_AZURE\_RESOURCE\_GROUP\_NAME) | Name of the resource group. | `string` | n/a | yes |
| <a name="input_dmz-Name"></a> [dmz-Name](#input\_dmz-Name) | DMZ Subnet Name | `string` | n/a | yes |
| <a name="input_dmz-Prefix"></a> [dmz-Prefix](#input\_dmz-Prefix) | DMZ Subnet Prefix | `string` | n/a | yes |
| <a name="input_external-Name"></a> [external-Name](#input\_external-Name) | External Subnet Name | `string` | n/a | yes |
| <a name="input_external-Prefix"></a> [external-Prefix](#input\_external-Prefix) | External Subnet Prefix | `string` | n/a | yes |
| <a name="input_internal-Name"></a> [internal-Name](#input\_internal-Name) | Internal Subnet Name | `string` | n/a | yes |
| <a name="input_internal-Prefix"></a> [internal-Prefix](#input\_internal-Prefix) | Internal Subnet Prefix | `string` | n/a | yes |
| <a name="input_vnetAddressPrefix"></a> [vnetAddressPrefix](#input\_vnetAddressPrefix) | Virtual Network Address prefix | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_VIP-public_ip_address"></a> [VIP-public\_ip\_address](#output\_VIP-public\_ip\_address) | n/a |
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | n/a |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | n/a |
| <a name="output_availability_set_fdc"></a> [availability\_set\_fdc](#output\_availability\_set\_fdc) | n/a |
| <a name="output_availability_set_id"></a> [availability\_set\_id](#output\_availability\_set\_id) | n/a |
| <a name="output_availability_set_name"></a> [availability\_set\_name](#output\_availability\_set\_name) | n/a |
| <a name="output_current_subscription_display_name"></a> [current\_subscription\_display\_name](#output\_current\_subscription\_display\_name) | n/a |
| <a name="output_current_subscription_id"></a> [current\_subscription\_id](#output\_current\_subscription\_id) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_tls_private_key"></a> [tls\_private\_key](#output\_tls\_private\_key) | n/a |
| <a name="output_vm_name"></a> [vm\_name](#output\_vm\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
