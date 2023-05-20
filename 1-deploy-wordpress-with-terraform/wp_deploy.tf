resource "kubernetes_deployment" "wp-deploy" {
  metadata {
    name = "demo-wordpress"
    labels = {
      app = "demo-wordpress"
    }
    namespace = var.namespace
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "demo-wordpress"
      }
    }

    template {
      metadata {
        labels = {
          app = "demo-wordpress"
        }
      }

      spec {
        container {
          name              = "demo-wordpress-container"
          image             = "wordpress:php8.0"
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 80
          }

          volume_mount {
            name       = "wordpress-data"
            mount_path = "/var/www/html/wp-content"
          }

          env {
            name  = "WORDPRESS_DB_HOST"
            value = "demo-mysql-service:3306"
          }
          env {
            name = "WORDPRESS_DB_PASSWORD"
            value_from {
              secret_key_ref {
                name = "wp-secrets"
                key  = "MYSQL_ROOT_PASSWORD"
              }
            }
          }
          env {
            name  = "WORDPRESS_DB_USER"
            value = "root"
          }
          env {
            name  = "WORDPRESS_DB_NAME"
            value = "wordpress"
          }

          lifecycle {
            post_start {
              exec {
                command = ["/bin/bash", "-c", "chown -R www-data:www-data /var/www; chmod -R 774 /var/www"]
              }
            }
          }
        }

        volume {
          name = "wordpress-data"
          persistent_volume_claim {
            claim_name = "demo-wordpress-pvc"
          }
        }
      }
    }
  }
}