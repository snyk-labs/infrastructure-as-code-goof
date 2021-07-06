resource "aws_security_group_rule" "denied" {
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

