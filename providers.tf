terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.14.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "helm" {
  # https://dev.to/danielepolencic/getting-started-with-terraform-and-kubernetes-on-azure-aks-3l4d
  kubernetes {
    host                   = azurerm_kubernetes_cluster.example.kube_config[0].host
    client_key             = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].client_key)
    client_certificate     = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].client_certificate)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.example.kube_config[0].host
  client_key             = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].client_key)
  client_certificate     = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].client_certificate)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].cluster_ca_certificate)
}

