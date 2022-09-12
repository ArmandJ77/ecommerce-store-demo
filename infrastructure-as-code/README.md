# [Work in progress]

## IaC for azure container apps demo using Terraform

### Authenticating using Azure Credentials

Ensure you have the az cli installed

cd into the working directory and run:

```
az login
```

Then ensure you selected the correct tenant and subscription.

### Initialise the terraform workspace

```
terraform init
```

Note: Must run terraform init if changes made in modules or adding a new module.

### Structure

- main.tf | entry point and coordinator for all infrastrucutre logic
- variables.tf | holds all the variables required for infrastructure
- modules | reuable resources

### Run TF

```
terraform init 
terraform plan
terraform apply
```




### Additional

If you like me and don;t want to constantly type out 'terraform' keyword and oyu using powershell, then you can set an alias.

```
Set-Alias -Name tf -Value terraform
```