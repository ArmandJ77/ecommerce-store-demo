resource "azapi_resource" "capp-webgateway" {
  name      = "capp-webgateway"
  location  = var.location
  parent_id = var.resource_group_id
  type      = "Microsoft.App/containerApps@2022-03-01"
  body = jsonencode({
    properties = {
      managedEnvironmentId = var.capp_environment_id
      configuration = {
        ingress = {
          targetPort = 80
          external   = true
        },
        registries = [
          {
            server            = var.cr_login_server
            username          = var.cr_admin_user
            passwordSecretRef = "registry-password"
          }
        ],
        secrets : [
          {
            name = "registry-password"
            # TODO: Investigate ACA support for Managed Identity connection to ACR
            value = var.cr_admin_password
          }
        ]
      },
      template = {
        containers = [
          {
            image = "${var.cr_login_server}/${var.app_image_name}:${var.app_image_tag}"
            resources = {
              cpu    = 0.25,
              memory = "0.5Gi"
            }
            name = var.app_name,
            env : [
              {
                "name" : "EnvVariable",
                "value" : "Value"
              }
            ],
            probes : [
              {
                type : "Startup"
                failureThreshold : 3,
                successThreshold : 1,
                initialDelaySeconds : 3,
                periodSeconds : 3,
                httpGet : {
                  path : "/startup",
                  port : 80,
                },
              },
              {
                type : "Readiness"
                failureThreshold : 3,
                successThreshold : 1,
                initialDelaySeconds : 5,
                periodSeconds : 3,
                httpGet : {
                  path : "/readiness",
                  port : 80,
                },
              },
              {
                type : "Liveness"
                failureThreshold : 3,
                successThreshold : 1,
                initialDelaySeconds : 7,
                periodSeconds : 10,
                httpGet : {
                  path : "/health",
                  port : 80,
                  httpHeaders : [
                    {
                      name : "Custom-Header",
                      value : "liveness probe"
                  }]
                },
              },
            ],
          }
        ],
        scale : {
          maxReplicas : 1,
          minReplicas : 1,
        },

      }
    }
  })
  # This seems to be important for the private registry to work(?)
  ignore_missing_property = true
  response_export_values  = ["properties.configuration.ingress"]
}
