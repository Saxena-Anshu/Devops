module "acr" {
  source = "./modules/acr"

  for_each = var.acrs

  resource_group_name   = var.resource_group_name
  location               = var.location
  container_registry_name = each.value.container_registry_name
  sku                    = each.value.sku
}


resource "azurerm_resource_provider_registration" "microsoft_app" {
  name = "Microsoft.App"
}


module "aca" {
  source = "./modules/aca"

  for_each = var.acas

  resource_group_name            = var.resource_group_name
  location                       = var.location

  container_app_environment_name = each.value.container_app_environment_name
  container_app_name             = each.value.container_app_name
  container_name                 = each.value.container_name
  container_image                = each.value.container_image
  cpu                            = each.value.cpu
  memory                         = each.value.memory


  depends_on = [
    azurerm_resource_provider_registration.microsoft_app,
    
  ]
}