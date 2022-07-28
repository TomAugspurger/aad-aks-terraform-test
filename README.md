# AKS

Example project using Terraform, AKS, Helm, and AKS-managed Azure AD (using a service principal for auth).

Copy `example.tfvars` to `values.tfvars` and fill in the values for a service principal.

```
$ terraform init
$ terraform apply -auto-approve -var-file=values.tfvars
```

The service principal may need some additional role assignments.
