variable "tm_name" {
  type        = string
  description = "The name of the Traffic manager."
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "tm_routing_method" {
  type        = string
  description = "The routing method for the traffic manager."
}

variable "tm_endpoints" {
  type = map(object({
    name               = string
    target_resource_id = string
  }))
}

variable "tags" {
  type = map(string)
}
