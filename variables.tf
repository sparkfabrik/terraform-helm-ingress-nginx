variable "helm_release_name" {
  description = "Name of the helm release."
  type        = string
  default     = "ingress-nginx"
}

variable "chart_version" {
  description = "Chart version of the ingress controller. Consider the default value the reference version of the module and the base of the values.yaml.tftpl file."
  type        = string
  default     = "4.11.2"
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

variable "set_controller_default_topology_spread_constraints" {
  description = "Set the topologySpreadConstraints for the ingress controller."
  type        = bool
  default     = true
}

variable "set_controller_default_topology_spread_constraints_max_skew" {
  description = "Set the topologyKey in the topologySpreadConstraints for the ingress controller."
  type        = number
  default     = 1
}

variable "set_controller_default_topology_spread_constraints_topology_key" {
  description = "Set the topologyKey in the topologySpreadConstraints for the ingress controller."
  type        = string
  default     = "kubernetes.io/hostname"
}

variable "set_controller_default_topology_spread_constraints_when_unsatisfiable" {
  description = "Set the whenUnsatisfiable policy in the topologySpreadConstraints for the ingress controller."
  type        = string
  default     = "ScheduleAnyway"
}
