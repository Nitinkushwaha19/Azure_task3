output "App" {
  value = {
    app_hostname = azurerm_windows_web_app.web_app.default_hostname
    web_app_id   = azurerm_windows_web_app.web_app.id
    web_app_name = azurerm_windows_web_app.web_app.name
  }
}
