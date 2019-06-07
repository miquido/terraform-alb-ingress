module "alb-ingress" {
  source                              = "git@github.com:cloudposse/terraform-aws-alb-ingress?ref=0.7.0"
  name                                = "${var.name}"
  namespace                           = "${var.project}"
  stage                               = "${var.environment}"
  tags                                = "${var.tags}"
  vpc_id                              = "${var.vpc_id}"
  unauthenticated_listener_arns       = "${var.listener_arns}"
  unauthenticated_listener_arns_count = "${var.listener_arns_count}"
  unauthenticated_hosts               = "${var.hosts}"
  unauthenticated_paths               = "${var.paths}"
  unauthenticated_priority            = "${var.priority}"
  port                                = "${var.port}"
  protocol                            = "${var.protocol}"
  health_check_path                   = "${var.health_check_path}"
  health_check_timeout                = "${var.health_check_timeout}"
  health_check_healthy_threshold      = "${var.health_check_healthy_threshold}"
  health_check_unhealthy_threshold    = "${var.health_check_unhealthy_threshold}"
  health_check_interval               = "${var.health_check_interval}"
  health_check_matcher                = "${var.health_check_matcher}"
}

module "alb-target-group-alarms" {
  source                  = "git@github.com:cloudposse/terraform-aws-alb-target-group-cloudwatch-sns-alarms.git?ref=0.6.1"
  enabled                 = "${var.alb_target_group_alarms_enabled}"
  name                    = "${var.name}"
  namespace               = "${var.project}"
  stage                   = "${var.environment}"
  tags                    = "${var.tags}"
  alb_name                = "${var.alb_name}"
  alb_arn_suffix          = "${var.alb_arn_suffix}"
  target_group_name       = "${module.alb-ingress.target_group_name}"
  target_group_arn_suffix = "${module.alb-ingress.target_group_arn_suffix}"

  elb_5xx_count_threshold        = "-1"
  alarm_actions                  = ["${var.alb_target_group_alarms_alarm_actions}"]
  ok_actions                     = ["${var.alb_target_group_alarms_ok_actions}"]
  insufficient_data_actions      = ["${var.alb_target_group_alarms_insufficient_data_actions}"]
  notify_arns                    = ["${var.alb_target_group_alarms_notify_arns}"]
  target_3xx_count_threshold     = "${var.alb_target_group_alarms_3xx_threshold}"
  target_4xx_count_threshold     = "${var.alb_target_group_alarms_4xx_threshold}"
  target_5xx_count_threshold     = "${var.alb_target_group_alarms_5xx_threshold}"
  target_response_time_threshold = "${var.alb_target_group_alarms_response_time_threshold}"
  period                         = "${var.alb_target_group_alarms_period}"
  evaluation_periods             = "${var.alb_target_group_alarms_evaluation_periods}"
  treat_missing_data             = "${var.alb_target_group_alarms_treat_missing_data}"
}
