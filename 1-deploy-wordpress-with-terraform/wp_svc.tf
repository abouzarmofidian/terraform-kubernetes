resource "kubernetes_service" "wp-svc" {
  metadata {
    name      = "demo-wordpress-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "demo-wordpress"
    }

    port {
      port      = 80
      node_port = 31000
    }
    type = "LoadBalancer"

  }
}