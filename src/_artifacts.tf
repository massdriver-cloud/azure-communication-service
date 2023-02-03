resource "massdriver_artifact" "azure-communication-service" {
  field                = "azure_communication_service"
  provider_resource_id = azurerm_communication_service.main.id
  name                 = "Azure Communication Services ${azurerm_communication_service.main.name}"
  artifact = jsonencode(
    {
      data = {
        infrastructure = {
          ari = azurerm_communication_service.main.id
        }
        authentication = {
          endpoint = "https://${azurerm_communication_service.main.name}.communication.azure.com"
        }
        security = {
          iam = {
            "read_write" = {
              role  = "Contributor"
              scope = azurerm_communication_service.main.id
            }
          }
        }
      }
      specs = {
        azure = {
          region = azurerm_communication_service.main.data_location
        }
      }
    }
  )
}
