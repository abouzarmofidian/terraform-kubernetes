resource "helm_release" "helm" {
  name             = var.name

  repository       = var.repository
  chart            = var.chart
  namespace        = var.namespace
  create_namespace = true
  #version          = var.app_version

}