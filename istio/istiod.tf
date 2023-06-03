module "istiod" {
  source     = "../modules/helm"
  namespace  = "istio-system"
  repository = "https://istio-release.storage.googleapis.com/charts"
  app = {
    deploy  = 1
    name    = "my-istiod-release"
    chart   = "istiod"
    version = "1.17.2"
  }

  set = [
    {
      name  = "global.istioNamespace"
      value = "istio-system"
    },
    {
      name  = "telemetry.enabled"
      value = "true"
    },
    {
      name  = "meshConfig.ingressService"
      value = "istio-gateway"
    },
    {
      name  = "meshConfig.ingressSelector"
      value = "gateway"
    }
  ]

  depends_on = [module.istio-base]

}