# Nginx Ingress Controller

This is Terraform module to install and configure the Nginx Ingress Controller.


<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.10 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.21 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.10 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.21 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_values"></a> [additional\_values](#input\_additional\_values) | Additional values to pass to the helm chart. | `list(string)` | `[]` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Chart version of the ingress controller. Consider the default value the reference version of the module and the base of the values.yaml.tftpl file. | `string` | `"4.10.1"` | no |
| <a name="input_common_labels"></a> [common\_labels](#input\_common\_labels) | Set of labels to apply to all resources. | `map(string)` | `{}` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Create namespace for the ingress controller. If false, the namespace must be created before using this module. | `bool` | `true` | no |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | Name of the helm release. | `string` | `"ingress-nginx"` | no |
| <a name="input_ingress_nginx_controller_max_replicas"></a> [ingress\_nginx\_controller\_max\_replicas](#input\_ingress\_nginx\_controller\_max\_replicas) | Maximum number of replicas for the ingress controller. | `number` | `3` | no |
| <a name="input_ingress_nginx_controller_min_replicas"></a> [ingress\_nginx\_controller\_min\_replicas](#input\_ingress\_nginx\_controller\_min\_replicas) | Minimum number of replicas for the ingress controller. | `number` | `1` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace of the ingress controller. | `string` | n/a | yes |
| <a name="input_namespace_additional_labels"></a> [namespace\_additional\_labels](#input\_namespace\_additional\_labels) | Additional labels for the namespace of the ingress controller. | `map(string)` | `{}` | no |
| <a name="input_set_controller_default_pod_anti_affinity"></a> [set\_controller\_default\_pod\_anti\_affinity](#input\_set\_controller\_default\_pod\_anti\_affinity) | Set the podAntiAffinity for the ingress controller. | `bool` | `true` | no |

## Outputs

No outputs.

## Resources

| Name | Type |
|------|------|
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |
| [kubernetes_namespace_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/namespace_v1) | data source |

## Modules

No modules.


<!-- END_TF_DOCS -->