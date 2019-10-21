variable "environment" {
  default     = ""
  description = "Environment name"
}

variable "name" {
  type        = string
  description = "Resource common name"
}

variable "project" {
  type        = string
  description = "Account/Project Name"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply on repository"
}

variable "hosts" {
  type        = list(string)
  default     = []
  description = "Hosts to match in Hosts header, at least one of hosts or paths must be set"
}

variable "paths" {
  type        = list(string)
  default     = []
  description = "Path pattern to match (a maximum of 1 can be defined), at least one of hosts or paths must be set"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where resources are created"
}

variable "listener_arns" {
  type        = list(string)
  default     = []
  description = "A list of ALB listener ARNs to attach ALB listener rule to"
}

variable "listener_arns_count" {
  type        = string
  default     = "2"
  description = "The number of ARNs in `listener_arns`. This is necessary to work around a limitation in Terraform where counts cannot be computed"
}

variable "priority" {
  type        = string
  default     = "100"
  description = "The priority for the rule between 1 and 50000 (1 being highest priority)"
}

variable "port" {
  type        = string
  default     = "80"
  description = "The port for generated ALB target group (if target_group_arn not set)"
}

variable "protocol" {
  type        = string
  default     = "HTTP"
  description = "The protocol for generated ALB target group (if target_group_arn not set)"
}

variable "health_check_path" {
  type        = string
  default     = "/"
  description = "The destination for the health check request"
}

variable "health_check_timeout" {
  type        = string
  default     = "10"
  description = "The amount of time to wait in seconds before failing a health check request"
}

variable "health_check_healthy_threshold" {
  type        = string
  default     = "2"
  description = "The number of consecutive health checks successes required before healthy"
}

variable "health_check_unhealthy_threshold" {
  type        = string
  default     = "2"
  description = "The number of consecutive health check failures required before unhealthy"
}

variable "health_check_interval" {
  type        = string
  default     = "15"
  description = "The duration in seconds in between health checks"
}

variable "health_check_matcher" {
  type        = string
  default     = "200-399"
  description = "The HTTP response codes to indicate a healthy check"
}

variable "alb_name" {
  type        = string
  description = "Name of the ALB for the Target Group. Required for alarms."
  default     = ""
}

variable "alb_arn_suffix" {
  type        = string
  description = "ARN suffix of the ALB for the Target Group. Required for alarms."
  default     = ""
}

##########
# ALARMS
##########

variable "alb_target_group_alarms_enabled" {
  type        = string
  description = "A boolean to enable/disable CloudWatch Alarms for ALB Target metrics"
  default     = "false"
}

variable "alb_target_group_alarms_3xx_threshold" {
  type        = string
  description = "The maximum number of 3XX HTTPCodes in a given period for ECS Service"
  default     = "25"
}

variable "alb_target_group_alarms_4xx_threshold" {
  type        = string
  description = "The maximum number of 4XX HTTPCodes in a given period for ECS Service"
  default     = "25"
}

variable "alb_target_group_alarms_5xx_threshold" {
  type        = string
  description = "The maximum number of 5XX HTTPCodes in a given period for ECS Service"
  default     = "25"
}

variable "alb_target_group_alarms_response_time_threshold" {
  type        = string
  description = "The maximum ALB Target Group response time"
  default     = "0.5"
}

variable "alb_target_group_alarms_period" {
  type        = string
  description = "The period (in seconds) to analyze for ALB CloudWatch Alarms"
  default     = "300"
}

variable "alb_target_group_alarms_evaluation_periods" {
  type        = string
  description = "The number of periods to analyze for ALB CloudWatch Alarms"
  default     = "1"
}

variable "alb_target_group_alarms_alarm_actions" {
  type        = list(string)
  description = "A list of ARNs (i.e. SNS Topic ARN) to execute when ALB Target Group alarms transition into an ALARM state from any other state"
  default     = []
}

variable "alb_target_group_alarms_ok_actions" {
  type        = list(string)
  description = "A list of ARNs (i.e. SNS Topic ARN) to execute when ALB Target Group alarms transition into an OK state from any other state"
  default     = []
}

variable "alb_target_group_alarms_insufficient_data_actions" {
  type        = list(string)
  description = "A list of ARNs (i.e. SNS Topic ARN) to execute when ALB Target Group alarms transition into an INSUFFICIENT_DATA state from any other state"
  default     = []
}

variable "alb_target_group_alarms_treat_missing_data" {
  type        = string
  description = "Sets how alarms handle missing data points. Values supported: missing, ignore, breaching and notBreaching."
  default     = "missing"
}

variable "alb_target_group_alarms_notify_arns" {
  type        = list(string)
  description = "A list of ARNs (i.e. SNS Topic ARN) to execute when this alarm transitions into ANY state from any other state. May be overridden by the value of a more specific {alarm,ok,insufficient_data}_actions variable. "
  default     = []
}

