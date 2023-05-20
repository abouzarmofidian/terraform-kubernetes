resource "kubernetes_persistent_volume" "pv" {
  count = length(var.pv_name)
  metadata {
    name = var.pv_name[count.index]
    labels = {
      type = var.pv_type
    }
  }

  spec {
    capacity = {
      storage = var.pv_capacity[count.index]
    }

    access_modes       = ["ReadWriteMany"]
    storage_class_name = "manual"

    persistent_volume_source {
      host_path {
        path = var.path[count.index]
      }
    }
  }

  depends_on = [kubernetes_namespace.namespace]
}