resource "aws_lb" "myproject" {
  name               = "myproject-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.myproject_lb.id]
  subnets            = ["subnet-0de79979472359bc7", "subnet-076193e2726917564"]
}

resource "aws_lb_listener" "myproject_80" {
  load_balancer_arn = aws_lb.myproject.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.myproject.arn
  }
}

resource "aws_lb_listener" "myproject_443" {
  load_balancer_arn = aws_lb.myproject.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:601731900643:certificate/8a7fffb4-9e2e-48f4-bf87-9d2590999f4d"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.myproject.arn
  }

}
