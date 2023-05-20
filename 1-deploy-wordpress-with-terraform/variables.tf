variable "config_path" {
  description = "Kubernetes config path"
  type        = string
}
variable "namespace" {}
variable "pv_name" {}
variable "pv_type" {}
variable "pv_capacity" {}
variable "path" {}
variable "pvc_name" {}
variable "pvc_capacity" {}
variable "secret_name" {}
variable "mysql_pass" {}
variable "replicas" {}
variable "container_name" {}
variable "image_name" {}
variable "mysql_port" {}
variable "protocol" {}