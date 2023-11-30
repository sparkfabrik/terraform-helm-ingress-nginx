module "ingress_nginx" {
  source                             = "../"
  chart_version                      = "4.8.3"
  namespace                          = "ingress-nginx"
  host                               = "https://test"
  cluster_ca_certificate             = base64decode("certificate")
  token                              = "token"
  namespace_lifecycle_ignore_changes = ["test"]
}
