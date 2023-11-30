resource "kubernetes_namespace_v1" "this" {
  metadata {
    labels = {
      name = var.namespace
    }
    name = var.namespace
  }

  lifecycle {
    ignore_changes = var.namespace_lifecycle_ignore_changes
  }
}

resource "helm_release" "this" {
  name       = var.helm_release_name
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version
  namespace  = kubernetes_namespace_v1.ingress_nginx.metadata[0].name

  values = concat(
    [file("${path.module}/values.yaml")],
    var.additional_values
  )
}
