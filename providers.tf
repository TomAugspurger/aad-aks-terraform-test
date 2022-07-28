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
    client_certificate     = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].client_certificate)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].cluster_ca_certificate)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      # Note: The AAD server app ID of AKS Managed AAD is always 6dae42f8-4368-4678-94ff-3960e28e3630 in any environments.
      # See https://github.com/Azure/kubelogin#exec-plugin-format
      args    = ["get-token", "--environment", "AzurePublicCloud", "--client-id", var.azure_client_id, "--client-secret", var.azure_client_secret, "--tenant-id", var.azure_tenant_id, "--login", "spn", "--server-id", "6dae42f8-4368-4678-94ff-3960e28e3630"]
      command = "kubelogin"
    }

  }
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.example.kube_config[0].host
  client_key             = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].client_key)
  client_certificate     = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].client_certificate)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.kube_config[0].cluster_ca_certificate)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    # Note: The AAD server app ID of AKS Managed AAD is always 6dae42f8-4368-4678-94ff-3960e28e3630 in any environments.
    # See https://github.com/Azure/kubelogin#exec-plugin-format
    args    = ["get-token", "--environment", "AzurePublicCloud", "--client-id", var.azure_client_id, "--client-secret", var.azure_client_secret, "--tenant-id", var.azure_tenant_id, "--login", "spn", "--server-id", "6dae42f8-4368-4678-94ff-3960e28e3630"]
    command = "kubelogin"
  }


}

