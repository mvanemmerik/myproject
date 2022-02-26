resource "aws_route53_record" "myproject" {
  zone_id = "Z03218901MURN2RG11MUB"
  name    = "ckpo.net"
  type    = "A"

  alias {
    name                   = aws_lb.myproject.dns_name
    zone_id                = aws_lb.myproject.zone_id
    evaluate_target_health = true
  }
}