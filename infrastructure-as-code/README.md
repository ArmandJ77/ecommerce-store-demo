# [Work in progress]

## IaC for azure container apps demo using Terraform

### AZ Guids
Need to create your own terraform.tfvars contining values for the following:

```
azure-subscription-id
azure-client-id
azure-client-secret
azure-tenant-id
```

### Initialise the terraform workspace

```
terraform init
```

### Structure

- main.tf | entry point and coordinator for all infrastrucutre logic
- variables.tf | holds all the variables required for infrastructure
- modules | reuable resources

### Run TF

```
terraform plan
```