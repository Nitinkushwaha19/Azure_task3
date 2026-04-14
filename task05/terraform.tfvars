# Tags 
tags = {
  "Creator" = "nitin_ajaykushwaha@epam.com"
}
# Resource Group details
resource_groups = {
  "RG1" = {
    name     = "cmaz-2ehw6cyk-mod5-rg-01"
    location = "eastus"
  }
  "RG2" = {
    name     = "cmaz-2ehw6cyk-mod5-rg-02"
    location = "westus"
  }
  "RG3" = {
    name     = "cmaz-2ehw6cyk-mod5-rg-03"
    location = "canadacentral"
  }
}


# App Service Plan details
asp_config = {

  "ASP1" = {
    name               = "cmaz-2ehw6cyk-mod5-asp-01"
    worker_count       = 2
    resource_group_key = "RG1"
  }

  "ASP1" = {
    name               = "cmaz-2ehw6cyk-mod5-asp-02"
    worker_count       = 1
    resource_group_key = "RG2"
  }
}

sku_name = "S1"


# App service details
app_config = {

  "APP1" = {
    name               = "cmaz-2ehw6cyk-mod5-app-01"
    resource_group_key = "RG1"
    asp_key            = "ASP1"
  }

  "APP2" = {
    name               = "cmaz-2ehw6cyk-mod5-app-02"
    resource_group_key = "RG2"
    asp_key            = "ASP2"
  }

}

ip_restrictions = [{
  name       = "allow-ip"
  priority   = 200
  action     = "Allow"
  ip_address = "18.153.146.156/32"
  },
  {
    name        = "allow-tm"
    priority    = 100
    action      = "Allow"
    service_tag = "AzureTrafficManager"
  }
]


# Traffic manager details
tm_name           = "cmaz-2ehw6cyk-mod5-traf"
tm_routing_method = "Performance"
