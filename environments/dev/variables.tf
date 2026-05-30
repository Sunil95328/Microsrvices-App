variable "resource_groups" {
  type = map(object({
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "container_registries" {
  type = map(object({
    resource_group_name = string
    sku                = optional(string, "Standard")
    admin_enabled      = optional(bool, false)
    tags               = optional(map(string), {})
  }))
}

variable "kubernetes_clusters" {
  type = map(object({
    resource_group_name = string
    dns_prefix          = string
    default_node_pool = object({
      name       = string
      node_count = optional(number, 1)
      vm_size    = string
    })
    tags = optional(map(string), {})
  }))
}
