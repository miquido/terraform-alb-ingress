<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->
[![Miquido][logo]](https://www.miquido.com/)

# miquido-terraform-alb-ingress
Quickly create ALB rules to newly created Target Group
---
**Terraform Module**
<!-- markdownlint-disable -->
## Makefile Targets
```text
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint Terraform code

```
<!-- markdownlint-restore -->
<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 2.42 |
| local | >= 1.3 |
| null | >= 2.0 |
| template | >= 2.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb\_arn\_suffix | ARN suffix of the ALB for the Target Group. Required for alarms. | `string` | `""` | no |
| alb\_target\_group\_alarms\_3xx\_threshold | The maximum number of 3XX HTTPCodes in a given period for ECS Service | `number` | `25` | no |
| alb\_target\_group\_alarms\_4xx\_threshold | The maximum number of 4XX HTTPCodes in a given period for ECS Service | `number` | `25` | no |
| alb\_target\_group\_alarms\_5xx\_threshold | The maximum number of 5XX HTTPCodes in a given period for ECS Service | `number` | `25` | no |
| alb\_target\_group\_alarms\_alarm\_actions | A list of ARNs (i.e. SNS Topic ARN) to execute when ALB Target Group alarms transition into an ALARM state from any other state | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| alb\_target\_group\_alarms\_elb\_5xx\_count\_threshold | The maximum count of ELB 5XX requests over a period. A negative value will disable the alert | `number` | `-1` | no |
| alb\_target\_group\_alarms\_enabled | A boolean to enable/disable CloudWatch Alarms for ALB Target metrics | `bool` | `false` | no |
| alb\_target\_group\_alarms\_evaluation\_periods | The number of periods to analyze for ALB CloudWatch Alarms | `number` | `1` | no |
| alb\_target\_group\_alarms\_httpcode\_alarm\_description | The string to format and use as the httpcode alarm description | `string` | `"HTTPCode %v count for %v over %v last %d minute(s) over %v period(s)"` | no |
| alb\_target\_group\_alarms\_insufficient\_data\_actions | A list of ARNs (i.e. SNS Topic ARN) to execute when ALB Target Group alarms transition into an INSUFFICIENT\_DATA state from any other state | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| alb\_target\_group\_alarms\_notify\_arns | A list of ARNs (i.e. SNS Topic ARN) to execute when this alarm transitions into ANY state from any other state. May be overridden by the value of a more specific {alarm,ok,insufficient\_data}\_actions variable. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| alb\_target\_group\_alarms\_ok\_actions | A list of ARNs (i.e. SNS Topic ARN) to execute when ALB Target Group alarms transition into an OK state from any other state | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| alb\_target\_group\_alarms\_period | The period (in seconds) to analyze for ALB CloudWatch Alarms | `number` | `300` | no |
| alb\_target\_group\_alarms\_response\_time\_alarm\_description | The string to format and use as the target response time alarm description | `string` | `"Target Response Time average for %v over %v last %d minute(s) over %v period(s)"` | no |
| alb\_target\_group\_alarms\_response\_time\_threshold | The maximum average target response time (in seconds) over a period. A negative value will disable the alert | `number` | `0.5` | no |
| alb\_target\_group\_alarms\_treat\_missing\_data | Sets how alarms handle missing data points. Values supported: missing, ignore, breaching and notBreaching. | `string` | `"missing"` | no |
| authenticated\_hosts | Authenticated hosts to match in Hosts header | `list(string)` | `[]` | no |
| authenticated\_listener\_arns | A list of authenticated ALB listener ARNs to attach ALB listener rules to | `list(string)` | `[]` | no |
| authenticated\_paths | Authenticated path pattern to match (a maximum of 1 can be defined) | `list(string)` | `[]` | no |
| authenticated\_priority | The priority for the rules with authentication, between 1 and 50000 (1 being highest priority). Must be different from `priority` since a listener can't have multiple rules with the same priority | `number` | `300` | no |
| authentication\_cognito\_user\_pool\_arn | Cognito User Pool ARN | `string` | `""` | no |
| authentication\_cognito\_user\_pool\_client\_id | Cognito User Pool Client ID | `string` | `""` | no |
| authentication\_cognito\_user\_pool\_domain | Cognito User Pool Domain. The User Pool Domain should be set to the domain prefix (`xxx`) instead of full domain (https://xxx.auth.us-west-2.amazoncognito.com) | `string` | `""` | no |
| authentication\_oidc\_authorization\_endpoint | OIDC Authorization Endpoint | `string` | `""` | no |
| authentication\_oidc\_client\_id | OIDC Client ID | `string` | `""` | no |
| authentication\_oidc\_client\_secret | OIDC Client Secret | `string` | `""` | no |
| authentication\_oidc\_issuer | OIDC Issuer | `string` | `""` | no |
| authentication\_oidc\_token\_endpoint | OIDC Token Endpoint | `string` | `""` | no |
| authentication\_oidc\_user\_info\_endpoint | OIDC User Info Endpoint | `string` | `""` | no |
| authentication\_type | Authentication type. Supported values are `COGNITO` and `OIDC` | `string` | `""` | no |
| default\_target\_group\_enabled | Enable/disable creation of the default target group | `bool` | `true` | no |
| deregistration\_delay | The amount of time to wait in seconds while deregistering target | `number` | `15` | no |
| environment | Environment name | `string` | `""` | no |
| health\_check\_enabled | Indicates whether health checks are enabled. Defaults to `true` | `bool` | `true` | no |
| health\_check\_healthy\_threshold | The number of consecutive health checks successes required before healthy | `number` | `2` | no |
| health\_check\_interval | The duration in seconds in between health checks | `number` | `15` | no |
| health\_check\_matcher | The HTTP response codes to indicate a healthy check | `string` | `"200-399"` | no |
| health\_check\_path | The destination for the health check request | `string` | `"/"` | no |
| health\_check\_port | The port to use to connect with the target. Valid values are either ports 1-65536, or `traffic-port`. Defaults to `traffic-port` | `string` | `"traffic-port"` | no |
| health\_check\_protocol | The protocol to use to connect with the target. Defaults to `HTTP`. Not applicable when `target_type` is `lambda` | `string` | `"HTTP"` | no |
| health\_check\_timeout | The amount of time to wait in seconds before failing a health check request | `number` | `10` | no |
| health\_check\_unhealthy\_threshold | The number of consecutive health check failures required before unhealthy | `number` | `2` | no |
| hosts | Unauthenticated hosts to match in Hosts header | `list(string)` | `[]` | no |
| listener\_arns | A list of unauthenticated ALB listener ARNs to attach ALB listener rules to | `list(string)` | `[]` | no |
| name | Resource common name | `string` | n/a | yes |
| paths | Unauthenticated path pattern to match (a maximum of 1 can be defined) | `list(string)` | `[]` | no |
| port | The port for generated ALB target group (if target\_group\_arn not set) | `number` | `80` | no |
| priority | The priority for the rules without authentication, between 1 and 50000 (1 being highest priority). Must be different from `authenticated_priority` since a listener can't have multiple rules with the same priority | `number` | `100` | no |
| project | Account/Project Name | `string` | n/a | yes |
| protocol | The protocol for generated ALB target group (if target\_group\_arn not set) | `string` | `"HTTP"` | no |
| slow\_start | The amount of time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. The default value is `0` seconds | `number` | `0` | no |
| stickiness\_cookie\_duration | The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds) | `number` | `86400` | no |
| stickiness\_enabled | Boolean to enable / disable `stickiness`. Default is `true` | `bool` | `false` | no |
| stickiness\_type | The type of sticky sessions. The only current possible value is `lb_cookie` | `string` | `"lb_cookie"` | no |
| tags | Tags to apply on repository | `map(string)` | `{}` | no |
| target\_group\_arn | Existing ALB target group ARN. If provided, set `default_target_group_enabled` to `false` to disable creation of the default target group | `string` | `""` | no |
| target\_type | The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group | `string` | `"ip"` | no |
| vpc\_id | The VPC ID where resources are created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| target\_group\_arn | ALB Target group ARN |
| target\_group\_arn\_suffix | ALB Target group ARN suffix |
| target\_group\_name | ALB Target group name |

<!-- markdownlint-restore -->


## Developing

1. Make changes in terraform files

2. Regenerate documentation

    ```bash
    bash <(git archive --remote=git@gitlab.com:miquido/terraform/terraform-readme-update.git master update.sh)
    ```

3. Run lint

    ```
    make lint
    ```

## Copyright

Copyright © 2017-2020 [Miquido](https://miquido.com)



### Contributors

|  [![Konrad Obal][k911_avatar]][k911_homepage]<br/>[Konrad Obal][k911_homepage] |
|---|

  [k911_homepage]: https://github.com/k911
  [k911_avatar]: https://github.com/k911.png?size=150



  [logo]: https://www.miquido.com/img/logos/logo__miquido.svg
  [website]: https://www.miquido.com/
  [gitlab]: https://gitlab.com/miquido
  [github]: https://github.com/miquido
  [bitbucket]: https://bitbucket.org/miquido

