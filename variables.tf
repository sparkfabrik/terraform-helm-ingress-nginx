variable "helm_release_name" {
  description = "Name of the helm release."
  type        = string
  default     = "ingress-nginx"
}

variable "chart_version" {
  description = "Chart version of the ingress controller. Consider the default value the reference version of the module and the base of the values.yaml.tftpl file."
  type        = string
  default     = "4.10.1"
}

variable "create_namespace" {
  description = "Create namespace for the ingress controller. If false, the namespace must be created before using this module."
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Namespace of the ingress controller."
  type        = string
}

variable "namespace_additional_labels" {
  description = "Additional labels for the namespace of the ingress controller."
  type        = map(string)
  default     = {}
}

variable "additional_values" {
  description = "Additional values to pass to the helm chart."
  type        = list(string)
  default     = []
}

variable "common_labels" {
  description = "Set of labels to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "ingress_nginx_controller_min_replicas" {
  description = "Minimum number of replicas for the ingress controller."
  type        = number
  default     = 1
}

variable "ingress_nginx_controller_max_replicas" {
  description = "Maximum number of replicas for the ingress controller."
  type        = number
  default     = 3
}

variable "set_controller_default_pod_anti_affinity" {
  description = "Set the podAntiAffinity for the ingress controller."
  type        = bool
  default     = true
}
