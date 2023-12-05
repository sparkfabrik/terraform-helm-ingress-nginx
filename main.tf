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
  chart      = "ingress-nginx"
  version    = var.chart_version
  namespace  = var.create_namespace ? kubernetes_namespace_v1.this[0].metadata[0].name : data.kubernetes_namespace_v1.this[0].metadata[0].name

  values = concat(
    [file("${path.module}/files/values.yaml")],
    var.additional_values
  )
}
