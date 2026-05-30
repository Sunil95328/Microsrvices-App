resource_groups = {
  "rg-micro-dev" = {
    location = "East US"
    tags     = { env = "dev", project = "microservices" }
  }
}

container_registries = {
  "acrmicrodev001" = {
    resource_group_name = "rg-micro-dev"
    sku                 = "Basic"
  }
}

kubernetes_clusters = {
  "aks-micro-dev" = {
    resource_group_name = "rg-micro-dev"
    dns_prefix          = "aksmicrodev"
    default_node_pool = {
      name       = "default"
      node_count = 2
      vm_size    = "Standard_DS2_v2"
    }
  }
}
