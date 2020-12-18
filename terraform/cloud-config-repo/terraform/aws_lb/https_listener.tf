resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "forward"
  }
}

resource "aws_alb_listener" "https" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "forward"
  }
}
