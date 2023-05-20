resource "kubernetes_service" "mysql-svc" {
  metadata {
    name      = "demo-mysql-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment.mysql-deploy.metadata.0.labels.app
    }
    port {
      port     = var.mysql_port
      protocol = var.protocol
    }
  }

}