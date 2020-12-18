resource "aws_security_group_rule" "allowed" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["1.0.0.0/0"]
  security_group_id = "sg-123456"
}
