module "name" {
  source     = "../modules/helm"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  app = {
    deploy  = 1
    name    = "my-prometheus"
    chart   = "kube-prometheus-stack"
    version = "46.5.0"
  }
}