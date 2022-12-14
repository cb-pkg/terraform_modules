resource "aws_autoscaling_group" "asg" {
  name                = var.name
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  health_check_type = "EC2"

  target_group_arns = var.target_group_arns

  timeouts {
    delete = "20m"
  }
}

resource "aws_autoscaling_policy" "asg_policy" {
  count                  = var.create_auto_scaling_policy ? 1 : 0
  name                   = "${var.name}-policy"
  scaling_adjustment     = var.scaling_adjustment
  adjustment_type        = var.adjustment_type
  cooldown               = var.scaling_cooldown
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.asg.name
}
