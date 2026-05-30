variable "kubernetes_clusters" {
  description = "Map of AKS clusters to create"
  type = map(object({
    resource_group_name = string
    location            = string
    dns_prefix          = string
    kubernetes_version  = optional(string)
    
    default_node_pool = object({
      name                = string
      node_count          = optional(number, 1)
      vm_size             = string
      enable_auto_scaling = optional(bool, false)
      min_count           = optional(number)
      max_count           = optional(number)
      type                = optional(string, "VirtualMachineScaleSets")
    })

    identity = optional(object({
      type = string
    }), { type = "SystemAssigned" })

    network_profile = optional(object({
      network_plugin    = optional(string, "kubenet")
      load_balancer_sku = optional(string, "standard")
    }))

    ingress_application_gateway = optional(object({
      gateway_id   = optional(string)
      gateway_name = optional(string)
      subnet_id    = optional(string)
      subnet_cidr  = optional(string)
    }))

    tags = optional(map(string), {})
  }))
}
