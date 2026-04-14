output "TM_Profile" {
  value = {
    TM_FQDN = azurerm_traffic_manager_profile.TM.fqdn
    TM_id   = azurerm_traffic_manager_profile.TM.id
  }
}

output "TM_Endpoint_ids" {
  value = {
    for key, endpoint in azurerm_traffic_manager_azure_endpoint.Tm_Endpoints :
    key => endpoint.id
  }
}
