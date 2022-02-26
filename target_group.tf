resource "aws_lb_target_group" "myproject" {
  name     = "myproject-asg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-00aa9a5954b477f89"
}

resource "aws_autoscaling_attachment" "myproject" {
  autoscaling_group_name = aws_autoscaling_group.myproject.id
  lb_target_group_arn    = aws_lb_target_group.myproject.arn
}