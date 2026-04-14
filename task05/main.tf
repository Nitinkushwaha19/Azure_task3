# Resource group
module "RG" {
  source = "./modules/resource_group"

  for_each            = var.resource_groups
  resource_group_name = each.value.name
  location            = each.value.location
  tags                = var.tags
}

# Azure service plan
module "ASP" {
  source = "./modules/app_service_plan"

  for_each = var.asp_config

  app_service_plan_name = each.value.name
  location              = module.RG[each.value.resource_group_key].resource_group_location
  resource_group_name   = module.RG[each.value.resource_group_key].resource_group_name
  worker_count          = each.value.worker_count
  tags                  = var.tags
}

module "APP" {
  source = "./modules/app_service"

  for_each = var.app_config

  windows_web_app_name = each.value.name
  rg_name              = module.RG[each.value.resource_group_key].resource_group_name
  location             = module.RG[each.value.resource_group_key].resource_group_location
  service_plan_id      = module.ASP[each.value.asp_key].asp_id

  ip_restrictions = var.ip_restrictions
  tags            = var.tags
}


module "TM" {
  source = "./modules/traffic_manager"

  tm_name           = var.tm_name
  rg_name           = module.RG["RG3"].resource_group_name
  tm_routing_method = var.tm_routing_method
  tags              = var.tags

  tm_endpoints = {
    for key, app in module.APP :
    key => {
      name               = app.App.web_app_name
      target_resource_id = app.App.web_app_id
    }
  }
}
