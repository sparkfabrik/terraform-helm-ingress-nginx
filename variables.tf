variable "chart_version" {
  description = "Chart version of the ingress controller"
  type        = string
}

variable "create_namespace" {
  description = "Create namespace for the ingress controller. If false, the namespace must be created before using this module"
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Namespace of the ingress controller"
  type        = string
}

variable "namespace_additional_labels" {
  description = "Additional labels for the namespace of the ingress controller"
  type        = map(string)
  default     = {}
}

variable "host" {
  description = "The hostname (in form of URI) of Kubernetes master"
  type        = string
}

variable "cluster_ca_certificate" {
  description = "PEM-encoded root certificates bundle for TLS authentication"
  type        = string
}

variable "token" {
  description = "Token to authenticate a service account"
  type        = string
}

variable "additional_values" {
  description = "Additional values to pass to the helm chart"
  type        = list(string)
  default     = []
}

variable "helm_release_name" {
  description = "Name of the helm release"
  type        = string
  default     = "ingress-nginx"
}
