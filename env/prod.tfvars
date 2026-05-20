resource_group_name            = "rg-anshu-cloudshell"
location                       = "eastus2"
acrs = {
  acr1 = {
    container_registry_name = "acrtestprodeus2001"
    sku                     = "Basic"
  }
}

acas = {
  aca1 = {
    container_app_environment_name = "acaenvtestprodeus2001"
    container_app_name             = "acatestprodeus2001"
    container_name                 = "acacontainer"
    container_image                = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    cpu                            = "0.5"
    memory                         = "1.0Gi"
  }
}