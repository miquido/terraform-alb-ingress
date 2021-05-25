module "alb-ingress" {
  source                       = "git::https://github.com/cloudposse/terraform-aws-alb-ingress?ref=tags/0.16.0"
  name                         = var.name
  namespace                    = var.project
  stage                        = var.environment
  tags                         = var.tags
  vpc_id                       = var.vpc_id
  target_type                  = var.target_type
  default_target_group_enabled = var.default_target_group_enabled
  target_group_arn             = var.target_group_arn
  deregistration_delay         = var.deregistration_delay
  port                         = var.port
  protocol                     = var.protocol
  slow_start                   = var.slow_start
  authentication_type          = var.authentication_type
  stickiness_enabled           = var.stickiness_enabled
  stickiness_type              = var.stickiness_type
  stickiness_cookie_duration   = var.stickiness_cookie_duration

  unauthenticated_listener_arns       = var.listener_arns
  unauthenticated_listener_arns_count = length(var.listener_arns)
  unauthenticated_hosts               = var.hosts
  unauthenticated_paths               = var.paths
  unauthenticated_priority            = var.priority

  authenticated_hosts                        = var.authenticated_hosts
  authenticated_listener_arns                = var.authenticated_listener_arns
  authenticated_listener_arns_count          = length(var.authenticated_listener_arns)
  authenticated_paths                        = var.authenticated_paths
  authenticated_priority                     = var.authenticated_priority
  authentication_cognito_user_pool_arn       = var.authentication_cognito_user_pool_arn
  authentication_cognito_user_pool_client_id = var.authentication_cognito_user_pool_client_id
  authentication_cognito_user_pool_domain    = var.authentication_cognito_user_pool_domain
  authentication_oidc_authorization_endpoint = var.authentication_oidc_authorization_endpoint
  authentication_oidc_client_id              = var.authentication_oidc_client_id
  authentication_oidc_client_secret          = var.authentication_oidc_client_secret
  authentication_oidc_issuer                 = var.authentication_oidc_issuer
  authentication_oidc_token_endpoint         = var.authentication_oidc_token_endpoint
  authentication_oidc_user_info_endpoint     = var.authentication_oidc_user_info_endpoint

  health_check_enabled             = var.health_check_enabled
  health_check_path                = var.health_check_path
  health_check_port                = var.health_check_port
  health_check_protocol            = var.health_check_protocol
  health_check_timeout             = var.health_check_timeout
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  health_check_interval            = var.health_check_interval
  health_check_matcher             = var.health_check_matcher
}

module "alb-target-group-alarms" {
  source                                 = "git::https://github.com/cloudposse/terraform-aws-alb-target-group-cloudwatch-sns-alarms.git?ref=tags/0.15.0"
  enabled                                = var.alb_target_group_alarms_enabled
  name                                   = var.name
  namespace                              = var.project
  stage                                  = var.environment
  tags                                   = var.tags
  alb_arn_suffix                         = var.alb_arn_suffix
  target_group_arn_suffix                = module.alb-ingress.target_group_arn_suffix
  alarm_actions                          = var.alb_target_group_alarms_alarm_actions
  ok_actions                             = var.alb_target_group_alarms_ok_actions
  insufficient_data_actions              = var.alb_target_group_alarms_insufficient_data_actions
  notify_arns                            = var.alb_target_group_alarms_notify_arns
  target_3xx_count_threshold             = var.alb_target_group_alarms_3xx_threshold
  target_4xx_count_threshold             = var.alb_target_group_alarms_4xx_threshold
  target_5xx_count_threshold             = var.alb_target_group_alarms_5xx_threshold
  elb_5xx_count_threshold                = var.alb_target_group_alarms_elb_5xx_count_threshold
  target_response_time_threshold         = var.alb_target_group_alarms_response_time_threshold
  period                                 = var.alb_target_group_alarms_period
  evaluation_periods                     = var.alb_target_group_alarms_evaluation_periods
  treat_missing_data                     = var.alb_target_group_alarms_treat_missing_data
  httpcode_alarm_description             = var.alb_target_group_alarms_httpcode_alarm_description
  target_response_time_alarm_description = var.alb_target_group_alarms_response_time_alarm_description
}

