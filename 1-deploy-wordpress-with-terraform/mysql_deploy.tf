resource "kubernetes_deployment" "mysql-deploy" {
  metadata {
    name = "demo-mysql"
    labels = {
      app = "demo-mysql"
    }
    namespace = var.namespace
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "demo-mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "demo-mysql"
        }
      }

      spec {
        container {
          name              = var.container_name
          image             = var.image_name
          image_pull_policy = "IfNotPresent"

          port {
            container_port = var.mysql_port
          }

          resources {
            limits = {
              cpu    = "1"
              memory = "1Gi"
            }
          }

          volume_mount {
            name       = "demo-mysql-init"
            mount_path = "/docker-entrypoint-initdb.d"
          }

          volume_mount {
            name       = "demo-mysql-data"
            mount_path = "/var/lib/mysql"
          }
          env {
            name  = "MYSQL_DATABASE"
            value = "wordpress"
          }
          env {
            name = "MYSQL_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name = "wp-secrets"
                key  = "MYSQL_ROOT_PASSWORD"
              }
            }
          }
        }

        volume {
          name = "demo-mysql-init"
          config_map {
            name = "demo-mysql-wp-config"
          }
        }

        volume {
          name = "demo-mysql-data"
          persistent_volume_claim {
            claim_name = "demo-mysql-pvc"
          }
        }
      }
    }
  }
}