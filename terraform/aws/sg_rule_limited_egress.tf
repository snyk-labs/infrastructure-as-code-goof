resource "aws_security_group_rule" "allowed" {
  type              = "egress"
  cidr_blocks       = ["192.168.1.1/24"]
}

