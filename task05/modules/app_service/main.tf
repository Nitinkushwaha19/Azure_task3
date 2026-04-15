resource "azurerm_windows_web_app" "web_app" {
  name                = var.windows_web_app_name
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {

    dynamic "ip_restriction" {
      for_each = var.ip_restrictions

      content {
        name     = ip_restriction.value.name
        priority = ip_restriction.value.priority
        action   = ip_restriction.value.action

        ip_address  = try(ip_restriction.value.ip_address, null)
        service_tag = try(ip_restriction.value.service_tag, null)
      }
    }

    ip_restriction_default_action = "Deny"
  }

  tags = var.tags
}
