resource "kubernetes_persistent_volume_claim" "pvc" {
  count = length(var.pvc_name)
  metadata {
    name      = var.pvc_name[count.index]
    namespace = var.namespace
  }

  spec {
    access_modes       = ["ReadWriteMany"]
    storage_class_name = "manual"
    resources {
      requests = {
        storage = var.pvc_capacity[count.index]
      }
    }

  }

  depends_on = [kubernetes_persistent_volume.pv]
}