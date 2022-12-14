output "lb_target_group_arn" {
  value = aws_lb_target_group.target_group.arn
}

output "lb_target_group_name" {
  value = aws_lb_target_group.target_group.name
}

output "dns_name" {
  value = aws_lb.lb.dns_name
}

output "lb_arn" {
  value = aws_lb.lb.arn
}
