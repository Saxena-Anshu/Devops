variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "container_registry_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "Standard"
}