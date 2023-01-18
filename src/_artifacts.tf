resource "massdriver_artifact" "api" {
  field                = "api"
  provider_resource_id = azurerm_communication_service.main.id
  name                 = "Azure Communication Services ${var.md_metadata.name_prefix} (${azurerm_communication_service.main.id})"
  artifact = jsonencode(
    {
      data = {
        infrastrucre = {
          ari = azurerm_communication_service.main.id
        }
        authentication = {
          hostname = "https://${var.md_metadata.name_prefix}.communication.azure.com"
          port     = 443
        }
        security = {
          iam = {
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
