locals {
  geo_location_map = {
    "Africa"        = "southafricanorth"
    "Asia Pacific"  = "southeastasia"
    "Australia"     = "australiaeast"
    "Brazil"        = "brazilsouth"
    "Canada"        = "canadacentral"
    "Europe"        = "westeurope"
    "France"        = "francecentral"
    "Germany"       = "germanywestcentral"
    "India"         = "centralindia"
    "Japan"         = "japaneast"
    "Korea"         = "koreacentral"
    "Norway"        = "norwayeast"
    "Switzerland"   = "switzerlandnorth"
    "UAE"           = "uaenorth"
    "UK"            = "uksouth"
    "United States" = "westus2"
  }
  location = lookup(local.geo_location_map, var.location, "")
}

resource "azurerm_resource_group" "main" {
  name     = var.md_metadata.name_prefix
  location = local.location
}

resource "azurerm_communication_service" "main" {
  name                = var.md_metadata.name_prefix
  resource_group_name = azurerm_resource_group.main.name
  data_location       = var.location
  tags                = var.md_metadata.default_tags
}
