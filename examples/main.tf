module "ingress_nginx" {
  source                 = "../"
  chart_version          = "4.8.3"
  namespace              = "ingress-nginx"
}
