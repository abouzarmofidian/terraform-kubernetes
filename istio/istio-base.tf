module "istio-base" {
  source     = "../modules/helm"
  namespace  = "istio-system"
  repository = "https://istio-release.storage.googleapis.com/charts"
  app = {
    deploy  = 1
    name    = "my-istio-base-release"
    chart   = "base"
    version = "1.17.2"
  }

  set = [
    {
      name  = "global.istioNamespace"
      value = "istio-system"
    }
  ]

}