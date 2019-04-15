module "alb-ingress" {
  source    = "git@github.com:cloudposse/terraform-aws-alb-ingress?ref=0.5.0"
  name      = "${var.name}"
  namespace = "${var.project}"
  stage     = "${var.environment}"
  tags      = "${var.tags}"

  vpc_id              = "${var.vpc_id}"
  listener_arns       = "${var.listener_arns}"
  listener_arns_count = "${var.listener_arns_count}"

  unauthenticated_hosts            = "${var.hosts}"
  unauthenticated_paths            = "${var.paths}"
  unauthenticated_priority         = "${var.priority}"
  port                             = "${var.port}"
  protocol                         = "${var.protocol}"
  health_check_path                = "${var.health_check_path}"
  health_check_timeout             = "${var.health_check_timeout}"
  health_check_healthy_threshold   = "${var.health_check_healthy_threshold}"
  health_check_unhealthy_threshold = "${var.health_check_unhealthy_threshold}"
  health_check_interval            = "${var.health_check_interval}"
  health_check_matcher             = "${var.health_check_matcher}"
}
