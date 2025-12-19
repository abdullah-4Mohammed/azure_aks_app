resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    vm_size             = "Standard_B2s_v2" # "Standard_DS2_v2" not supported on free account
    type                = "VirtualMachineScaleSets"
    # zones  = [1, 2, 3] #not supported in the free tier weu region
    zones  = []
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }
}

## add file storage for kubernetes cluster to use for persistent volumes
# resource "azurerm_storage_share" "fileshare" {
#   name                 = var.fileshare_name
#   storage_account_name = "dia23tfstatestor"
#   quota                = 50  # size in GB
# }

