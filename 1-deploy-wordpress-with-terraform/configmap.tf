resource "kubernetes_config_map" "configmap" {
  metadata {
    name = "demo-mysql-wp-config"
    namespace = "demo-wordpress"
  }

  data = {
    "init.sql" = file("init.sql")
  }
}