## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Environment name | string | `` | no |
| health_check_healthy_threshold | The number of consecutive health checks successes required before healthy | string | `2` | no |
| health_check_interval | The duration in seconds in between health checks | string | `15` | no |
| health_check_matcher | The HTTP response codes to indicate a healthy check | string | `200-399` | no |
| health_check_path | The destination for the health check request | string | `/` | no |
| health_check_timeout | The amount of time to wait in seconds before failing a health check request | string | `10` | no |
| health_check_unhealthy_threshold | The number of consecutive health check failures required before unhealthy | string | `2` | no |
| hosts | Hosts to match in Hosts header, at least one of hosts or paths must be set | list | `<list>` | no |
| listener_arns | A list of ALB listener ARNs to attach ALB listener rule to | list | `<list>` | no |
| listener_arns_count | The number of ARNs in `listener_arns`. This is necessary to work around a limitation in Terraform where counts cannot be computed | string | `2` | no |
| name | Resource common name | string | - | yes |
| paths | Path pattern to match (a maximum of 1 can be defined), at least one of hosts or paths must be set | list | `<list>` | no |
| port | The port for generated ALB target group (if target_group_arn not set) | string | `80` | no |
| priority | The priority for the rule between 1 and 50000 (1 being highest priority) | string | `100` | no |
| project | Account/Project Name | string | - | yes |
| protocol | The protocol for generated ALB target group (if target_group_arn not set) | string | `HTTP` | no |
| tags | Tags to apply on repository | map | `<map>` | no |
| vpc_id | The VPC ID where resources are created | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| target_group_arn | ALB Target group ARN |
| target_group_arn_suffix | ALB Target group ARN suffix |
| target_group_name | ALB Target group name |

