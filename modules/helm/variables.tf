variable "namespace" {
  description = "namespace where to deploy an application"
  type        = string
}
variable "app" {
  description = "an application to deploy"
  type        = map(any)
}
variable "repository" {
  description = "Helm repository"
  type        = string
}
variable "set" {
  description = "Value block with custom STRING values to be merged with the values yaml."
  type = list(object({
    name  = string
    value = string
  }))
  default = null
}
