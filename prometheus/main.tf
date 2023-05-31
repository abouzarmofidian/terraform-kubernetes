module "name" {
  source = "../modules/helm"

  name       = "my-prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "monitoring"
  #version    = "46.5.0"
}