module "resource_groups" {
  source          = "../../modules/resource_group"
  resource_groups = var.resource_groups
}

module "acr" {
  source = "../../modules/acr"

  container_registries = {
    for k, v in var.container_registries : k => merge(v, {
      location = module.resource_groups.resource_groups[v.resource_group_name].location
    })
  }

  depends_on = [module.resource_groups]
}

module "aks" {
  source = "../../modules/aks"

  kubernetes_clusters = {
    for k, v in var.kubernetes_clusters : k => merge(v, {
      location = module.resource_groups.resource_groups[v.resource_group_name].location
    })
  }

  depends_on = [module.resource_groups]
}
