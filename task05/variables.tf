# Tags
variable "tags" {
  type        = map(string)
  description = "Tags of the resources."
}

# Resource Group variables
variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))

  description = "A map of resource group objects"
}


# App Service Plan variables
variable "asp_config" {
  type = map(object({
    name               = string
    worker_count       = number
    resource_group_key = string
  }))

  description = "A map of App Service Plan configurations."
}

variable "sku_name" {
  type = string
}

# App Service
variable "app_config" {
  type = map(object({
    name               = string
    resource_group_key = string
    asp_key            = string
  }))
  description = "A map of App Service configurations."
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    priority    = number
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
  description = "IP Restrictions for the App service"
}


# Traffic Manager variables 
variable "tm_name" {
  type        = string
  description = "The name of the Traffic manager."
}

variable "tm_routing_method" {
  type        = string
  description = "The routing method uesd by traffic manager."
  default     = "Performance"
}
