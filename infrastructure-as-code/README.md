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

### Terraform commands

```
terraform init -- This will initialise the TF state file
terraform plan -- Calculate and display the proposed changes
terraform apply -- Apply the proposed changes to the environment
```

### Pushing Contianers to the acr (TODO: Move to a github action)

Note: This is just for faster local testing an will be moved into a github action
open a powershell terminal.

run

```
az login
```
You need to sign in to the created ACR else the script can't auth
```
az acr login -n crsharedhappeningfactory
```

cd into the \webgateway dir

run
```
.\docker-local-build-push.ps1
```

TODO: Investigate the Github deployment pipline of the contaier app and its integration with Terraform

### Additional

If you like me and don't want to constantly type out 'terraform' keyword and oyu using powershell, then you can set an alias.

```
Set-Alias -Name tf -Value terraform
```