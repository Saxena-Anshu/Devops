variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "acrs" {
  type = map(object({
    container_registry_name = string
    sku                     = optional(string, "Standard")
  }))
}


variable "acas" {
  type = map(object({
    container_app_environment_name = string
    container_app_name             = string
    container_name                 = string
    container_image                = string
    cpu                            = number
    memory                         = string
  }))

  default = {}
}