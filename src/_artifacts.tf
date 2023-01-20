resource "massdriver_artifact" "api" {
  field                = "api"
  provider_resource_id = azurerm_communication_service.main.id
  name                 = "Azure Communication Services ${azurerm_communication_service.main.name}"
  artifact = jsonencode(
    {
      data = {
        etc = {
          ari = azurerm_communication_service.main.id
        }
        api = {
          hostname = "https://${azurerm_communication_service.main.name}.communication.azure.com"
          port     = 443
        }
      }
      specs = {
        azure = {
          region = azurerm_communication_service.main.data_location
        }
        api = {
          version = "n/a"
        }
      }
    }
  )
}
