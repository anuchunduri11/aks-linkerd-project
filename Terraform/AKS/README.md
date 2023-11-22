# aks-istio-project
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.54.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.75.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.acr_pull](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.vnet_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_subnet.aks_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vir_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_subnet_address_prefix2"></a> [aks\_subnet\_address\_prefix2](#input\_aks\_subnet\_address\_prefix2) | AKS Subnet Address prefix | `string` | n/a | yes |
| <a name="input_devopspool_count"></a> [devopspool\_count](#input\_devopspool\_count) | No of nodes in AKS Cluster | `number` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location for services | `string` | `"swedencentral"` | no |
| <a name="input_name"></a> [name](#input\_name) | Prefix of name for resources | `string` | `"anuchunduridevops"` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH key to access AKS cluster | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | AKS cluster VM size/type | `string` | n/a | yes |
| <a name="input_vnet_address_space2"></a> [vnet\_address\_space2](#input\_vnet\_address\_space2) | Azure VNET Address Space | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
