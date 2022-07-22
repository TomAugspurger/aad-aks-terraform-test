# AKS

```
$ terraform init
$ terraform apply -auto-approve
```

Output

```
azurerm_kubernetes_cluster.example: Creation complete after 4m51s [id=/subscriptions/<subscription-id>/resourceGroups/example-aks-resources/providers/Microsoft.ContainerService/managedClusters/example-aks1]
helm_release.nginx_ingress: Creating...
╷
│ Error: Kubernetes cluster unreachable: the server has asked for the client to provide credentials
│
│   with helm_release.nginx_ingress,
│   on aks.tf line 43, in resource "helm_release" "nginx_ingress":
│   43: resource "helm_release" "nginx_ingress" {
│
╵
```