# backend

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for backend microservices

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apm.serverUrl | string | `"http://apm-server-apm-server.logging.svc.cluster.local:8200"` |  |
| application.autoscaling.enabled | bool | `true` | Toggle on and off whether to enable the pod autoscaler |
| application.autoscaling.maxReplicas | int | `5` | The maximum number of replicas allowed |
| application.autoscaling.minReplicas | int | `1` | The minimum number of replicas allowed |
| application.autoscaling.targetCPUUtilizationPercentage | int | `80` | The CPU usage threshold percentage before autoscaling |
| application.autoscaling.targetMemoryUtilizationPercentage | int | `80` | The memory usage threshold percentage before autoscaling |
| application.configMaps | string | `nil` | Files to inject into containers for configuration. See (https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/) |
| application.container.httpPort | int | `3430` | The HTTP port the container listens on |
| application.container.tcpPort | int | `3431` | The TCP port the container listens on |
| application.dbAccess.existingSecretName | string | `""` | The name of the existing secret to use for database access |
| application.env | object | `{}` | Extra environment variables that will be passed into pods |
| application.envFromSecret | list | `[]` | Extra environment variables (from existing secrets) that will be passed into pods |
| application.externalSecrets | object | `{"additional":[],"application":[],"database":[]}` | External Secret Configuration |
| application.externalSecrets.additional | list | `[]` | Additional external secrets |
| application.externalSecrets.application | list | `[]` | Configuration for application secret (not database) |
| application.externalSecrets.database | list | `[]` | Configuration for database secret |
| application.image.additionalContainers | list | `[]` |  |
| application.image.additionalInitContainers | list | `[]` |  |
| application.image.additionalPorts | list | `[]` | Allow for additional ports inside the main container |
| application.image.args | list | `[]` | Additional args when needed. Env vars should always be prefered. |
| application.image.imagePullSecretName | string | `""` | The Kubernetes secret used to allow pulling the image from a private image registry. |
| application.image.pullPolicy | string | `"Always"` |  |
| application.image.repository | string | `"registry.devops-algbra.com/microservices/example"` | Location of the container image for the actual application |
| application.image.semver | string | `""` | If set will allow flux to promote images. (i.e 1.0.x) |
| application.image.tag | string | `"0.0.0"` | The version of the application |
| application.ingress.albGroupName | string | `""` | The name of the ALB group |
| application.ingress.allowedSourceRanges | string | `""` | Comma separated CIDRs/IPs of ALBs making request to the pod |
| application.ingress.certArn | string | `""` | The ARN of the certificate to use for the ingres |
| application.ingress.domain | string | `""` | The domain to use for the ingress |
| application.ingress.enabled | bool | `false` | Toggle on and off whether to enable the ingress |
| application.ingress.logging.bucket | string | `"some-s3-bucket"` | The S3 bucket to use for logging |
| application.ingress.logging.enabled | bool | `false` | Toggle on and off whether to enable logging |
| application.ingress.prefix | string | `""` | The prefix to use for the ingress |
| application.ingress.scheme | string | `"internet-facing"` | The scheme to use for the ingress |
| application.ingress.targetType | string | `"ip"` | The type of target to use for the ingress |
| application.ingress.wafArn | string | `""` | The ARN of the WAF to use for the ingress |
| application.livenessProbe.failureThreshold | int | `24` | Minimum consecutive failures for the probe |
| application.livenessProbe.httpGet.path | string | `"/health"` | The path within the container to use for probing |
| application.livenessProbe.httpGet.port | string | `"http"` | The port within the container to use for probing |
| application.livenessProbe.initialDelaySeconds | int | `0` | Delay before probe is initiated in seconds |
| application.livenessProbe.timeoutSeconds | int | `30` | When the probe times out in seconds |
| application.minReadySeconds | int | `10` | Delay when deploying before we start running liveness checks (bringing the service online) |
| application.nodeSelector | object | `{}` | Allow assigning pods to nodes (see https://kubernetes.io/docs/concepts/configuration/assign-pod-node/) |
| application.podAnnotations | object | `{}` | A list of Pod annotations. |
| application.readinessProbe.failureThreshold | int | `24` | Minimum consecutive failures for the probe |
| application.readinessProbe.httpGet.path | string | `"/health"` | The path within the container to use for probing |
| application.readinessProbe.httpGet.port | string | `"http"` | The port within the container to use for probing |
| application.readinessProbe.initialDelaySeconds | int | `0` | Delay before probe is initiated in seconds |
| application.readinessProbe.timeoutSeconds | int | `30` | When the probe times out in seconds |
| application.replicaCount | int | `1` | Number of replicas to create |
| application.resources.limits | object | `{}` |  |
| application.resources.requests | object | `{}` | memory: 1024Mi |
| application.service.annotations | object | `{}` | A list of service annotations |
| application.service.ports.http | int | `80` |  |
| application.service.ports.tcp | int | `81` |  |
| application.serviceAccount.annotations | object | `{}` | A list of service account annotations |
| application.snapshot | bool | `false` | Whether the release is a snapshot |
| application.startupProbe.failureThreshold | int | `30` | Minimum consecutive failures for the probe |
| application.startupProbe.httpGet.path | string | `"/health"` | The path within the container to use for probing |
| application.startupProbe.httpGet.port | string | `"http"` | The port within the container to use for probing |
| application.startupProbe.periodSeconds | int | `10` | How often (in seconds) to perform the probe |
| application.startupProbe.timeoutSeconds | int | `10` | When the probe times out in seconds |
| application.strategy.rollingUpdate.maxSurge | string | `"50%"` |  |
| application.strategy.type | string | `"RollingUpdate"` |  |
| application.subsystem | string | `""` | The subsystem the application belongs to |
| application.tolerations | list | `[]` | Ensure pods are scheduled to appropriate nodes (see https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |
| application.volumes | object | `{"configMapVolumes":[],"emptyDirVolumes":[],"persistentVolumes":[],"secretVolumes":[]}` | Defines volumes and volumeMounts for secrets, configMaps, emptyDirs and persistentVolumes |
| application.volumes.configMapVolumes | list | `[]` | Additional config map volumes (see values.yaml for an example) |
| application.volumes.emptyDirVolumes | list | `[]` | A list of emptyDir volumes |
| application.volumes.persistentVolumes | list | `[]` | A list of persistent volumes to create |
| application.volumes.secretVolumes | list | `[]` | Map secrets to volumes. (See  https://kubernetes.io/docs/concepts/storage/volumes/) |
| environment | string | `""` | The environment the application is running in |
| istio.authorizationPolicy.additionalRules | list | `[]` | Additional rules could be added here |
| istio.authorizationPolicy.allowedNamespaces | list | `[]` | Allow all traffic from one or more namespaces |
| istio.authorizationPolicy.allowedServiceAccounts | list | `[]` | More granular control per service account if needed (name, namespaces (optional array to override default)) |
| istio.authorizationPolicy.enabled | bool | `false` |  |
| istio.enabled | bool | `false` |  |
| istio.excludeOutboundIPRanges | object | `{}` | A list of IP ranges in CIDR form to be excluded from redirection. |
| istio.excludedOutboundPorts | object | `{}` | A list of outbound ports to be excluded from redirection to Envoy |
| istio.ingressGateway | object | `{"name":"istio-ingressgateway","namespace":"istio-system"}` | Istio Authorization Policy Configuration |
| istio.ingressGateway.name | string | `"istio-ingressgateway"` | The istio ingress gateway name |
| istio.ingressGateway.namespace | string | `"istio-system"` | The istio ingress gateway namespace |
| kafka.clusterName | string | `"kafka"` | Kafka Cluster Name |
| kafka.defaults | object | `{"config":{"partitions":9,"replicas":3,"retention":-1,"segmentBytes":1073741824}}` | Kafka Default Cluster Configuration |
| kafka.defaults.config.partitions | int | `9` | Kafka Cluster Partitions (default 9) |
| kafka.defaults.config.replicas | int | `3` | Kafka Cluster Replicas (default 3) |
| kafka.defaults.config.retention | int | `-1` | Kafka Cluster Retention (default -1 means infinite retention) |
| kafka.defaults.config.segmentBytes | int | `1073741824` | Kafka Cluster Segment Bytes (default 1073741824) |
| kafka.enabled | bool | `false` | Enable Kafka |
| kafka.schemaRegistryUrl | string | `""` | Schema Registry URL (defaults to http:// algbra-schema-registry.microservices.svc.cluster.local:8081 if not set) |
| kafka.topics | list | `[]` |  |
| mongo.enabled | bool | `false` |  |
| podSecurityContext | object | `{}` | The security contexts at the pod level |
| securityContexts | object | `{"application":{}}` | The security contexts at the individual container level |
| snapshot | bool | `false` | Determines if the release is a snapshot |
| tenant.id | string | `""` | The ID for the tenant |
| tenant.name | string | `""` | The name of the tenant (either algbra, shared or shoal) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
