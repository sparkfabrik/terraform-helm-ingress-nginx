locals {
  chart_name = "ingress-nginx"
}

resource "kubernetes_namespace_v1" "this" {
  count = var.create_namespace ? 1 : 0

  metadata {
    labels = merge(
      {
        name = var.namespace
      },
      var.namespace_additional_labels
    )
    name = var.namespace
  }
}

data "kubernetes_namespace_v1" "this" {
  count = var.create_namespace ? 0 : 1

  metadata {
    name = var.namespace
  }
}

resource "helm_release" "this" {
  name       = var.helm_release_name
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = local.chart_name
  version    = var.chart_version
  namespace  = var.create_namespace ? kubernetes_namespace_v1.this[0].metadata[0].name : data.kubernetes_namespace_v1.this[0].metadata[0].name

  values = concat(
    [
      templatefile(
        "${path.module}/files/values.yaml.tftpl",
        {
          common_labels                                                         = var.common_labels
          ingress_nginx_controller_min_replicas                                 = var.ingress_nginx_controller_min_replicas
          ingress_nginx_controller_max_replicas                                 = var.ingress_nginx_controller_max_replicas
          set_controller_default_topology_spread_constraints                    = var.set_controller_default_topology_spread_constraints
          set_controller_default_topology_spread_constraints_max_skew           = var.set_controller_default_topology_spread_constraints_max_skew
          set_controller_default_topology_spread_constraints_topology_key       = var.set_controller_default_topology_spread_constraints_topology_key
          set_controller_default_topology_spread_constraints_when_unsatisfiable = var.set_controller_default_topology_spread_constraints_when_unsatisfiable

          # Variables for creating the selector labels.
          # If you use `nameOverride` in your values, you should use that instead of `chart_name`.
          # See how the Helm chart creates the selector labels.
          chart_name   = local.chart_name
          release_name = var.helm_release_name
        }
      )
    ],
    var.additional_values
  )
}
