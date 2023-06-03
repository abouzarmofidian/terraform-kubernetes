resource "helm_release" "helm" {
  count            = var.app["deploy"] ? 1 : 0
  namespace        = var.namespace
  create_namespace = true
  repository       = var.repository
  name             = var.app["name"]
  chart            = var.app["chart"]
  version          = var.app["version"]
}