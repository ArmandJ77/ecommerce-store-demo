# ecommerce-store-demo

## Current state of the project

- Currently the infrastructure-as-code directory contians module based Terraform scripts when ran will create:
- Resource Groups
- Log analytics workspace
- Azure Container Registry
- Azure Container App environment
- Under app/gateway contains the terraform script required to spin up a new contianer app. Note you would wirst need to push the web gateway container to the ACR so taht when the deployment goes through for the GatewayApp that the container is available, else the deployment will fail.
- Along with the Gateway app it contains 3 probe endpoints which maps toa  very genric web api controller which returns a string and 200 response.

## Next Steps
Is to create a github action CI/CD pipeline that can build up and deploy the apps and tear down the environment when not in use
