output "target_group_name" {
  description = "ALB Target group name"
  value       = module.alb-ingress.target_group_name
}

output "target_group_arn" {
  description = "ALB Target group ARN"
  value       = module.alb-ingress.target_group_arn
}

output "code_deploy_group_arn" {
  description = "ALB second Target Group ARN for Code deploy"
  value       = module.alb-ingress.code_deploy_group_arn
}

output "target_group_arn_suffix" {
  description = "ALB Target group ARN suffix"
  value       = module.alb-ingress.target_group_arn_suffix
}

######### ALARMS ###########

output "httpcode_target_3xx_count_cloudwatch_metric_alarm_id" {
  value       = module.alb-target-group-alarms.httpcode_target_3xx_count_cloudwatch_metric_alarm_id
  description = "Target Group 3xx count CloudWatch metric alarm ID"
}

output "httpcode_target_3xx_count_cloudwatch_metric_alarm_arn" {
  value       = module.alb-target-group-alarms.httpcode_target_3xx_count_cloudwatch_metric_alarm_arn
  description = "Target Group 3xx count CloudWatch metric alarm ARN"
}

output "httpcode_target_4xx_count_cloudwatch_metric_alarm_id" {
  value       = module.alb-target-group-alarms.httpcode_target_4xx_count_cloudwatch_metric_alarm_id
  description = "Target Group 4xx count CloudWatch metric alarm ID"
}

output "httpcode_target_4xx_count_cloudwatch_metric_alarm_arn" {
  value       = module.alb-target-group-alarms.httpcode_target_4xx_count_cloudwatch_metric_alarm_arn
  description = "Target Group 4xx count CloudWatch metric alarm ARN"
}

output "httpcode_target_5xx_count_cloudwatch_metric_alarm_id" {
  value       = module.alb-target-group-alarms.httpcode_target_5xx_count_cloudwatch_metric_alarm_id
  description = "Target Group 5xx count CloudWatch metric alarm ID"
}

output "httpcode_target_5xx_count_cloudwatch_metric_alarm_arn" {
  value       = module.alb-target-group-alarms.httpcode_target_5xx_count_cloudwatch_metric_alarm_arn
  description = "Target Group 5xx count CloudWatch metric alarm ARN"
}

output "httpcode_elb_5xx_count_cloudwatch_metric_alarm_id" {
  value       = module.alb-target-group-alarms.httpcode_elb_5xx_count_cloudwatch_metric_alarm_id
  description = "ELB 5xx count CloudWatch metric alarm ID"
}

output "httpcode_elb_5xx_count_cloudwatch_metric_alarm_arn" {
  value       = module.alb-target-group-alarms.httpcode_elb_5xx_count_cloudwatch_metric_alarm_arn
  description = "ELB 5xx count CloudWatch metric alarm ARN"
}

output "target_response_time_average_cloudwatch_metric_alarm_id" {
  value       = module.alb-target-group-alarms.target_response_time_average_cloudwatch_metric_alarm_id
  description = "Target Group response time average CloudWatch metric alarm ID"
}

output "target_response_time_average_cloudwatch_metric_alarm_arn" {
  value       = module.alb-target-group-alarms.target_response_time_average_cloudwatch_metric_alarm_arn
  description = "Target Group response time average CloudWatch metric alarm ARN"
}
