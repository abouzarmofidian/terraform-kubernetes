resource "kubernetes_secret" "secret" {
  metadata {
    name      = var.secret_name
    namespace = var.namespace
  }

  data = {
    MYSQL_ROOT_PASSWORD = var.mysql_pass
  }

}