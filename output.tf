output "loadbalancer_dns" {
  value = aws_lb.myproject.dns_name
}
