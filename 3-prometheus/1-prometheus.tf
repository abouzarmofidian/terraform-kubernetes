#helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
#helm repo update

#helm install prometheus -n monitoring --namespace --create-namespace prometheus-community/kube-prometheus-stack

resource "helm_release" "prometheus" {
  name = "my-prometheus"

  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true
  #version          = "22.6.2"

}