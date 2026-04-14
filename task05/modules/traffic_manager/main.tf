resource "azurerm_traffic_manager_profile" "TM" {
  name                   = var.tm_name
  resource_group_name    = var.rg_name
  traffic_routing_method = var.tm_routing_method

  dns_config {
    relative_name = var.tm_name
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "Tm_Endpoints" {

  for_each = var.tm_endpoints

  name               = each.value.name
  profile_id         = azurerm_traffic_manager_profile.TM.id
  target_resource_id = each.value.target_resource_id
}
