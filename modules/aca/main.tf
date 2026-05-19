resource "azurerm_container_app_environment" "example" {
  name                = var.container_app_environment_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_container_app" "example" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name          = var.resource_group_name

  revision_mode = "Single"

  template {
    container {
      name   = var.container_name
      image  = var.container_image

      cpu    = var.cpu
      memory = var.memory
    }
  }

  ingress {
    external_enabled = true
    target_port      = 80

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
}