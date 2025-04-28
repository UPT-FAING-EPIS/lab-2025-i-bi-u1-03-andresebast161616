provider "azurerm" {
  features {}
  subscription_id = "ae10a970-9237-49d4-a706-f32fc2ffaee8"
}

resource "azurerm_resource_group" "rg" {
  name     = "azurelab3powerbi-rg"  # Cambié el nombre del grupo de recursos
  location = var.location
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = "azurelab3powerbi-server"  # Cambié el nombre del servidor SQL
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  express_vulnerability_assessment_enabled = false
  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_mssql_database" "sql_db" {
  name               = "azurelab3powerbi-db"  # Cambié el nombre de la base de datos
  server_id          = azurerm_mssql_server.sql_server.id
  collation          = "SQL_Latin1_General_CP1_CI_AS"
  sku_name           = "Basic"
  max_size_gb        = 2
  depends_on = [azurerm_mssql_server.sql_server]
}
