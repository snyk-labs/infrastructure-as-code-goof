resource "aws_network_acl_rule" "allowed" {
  network_acl_id = aws_network_acl.bar.id
  rule_number    = 201
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "1.0.0.0/0"
  from_port      = 22
  to_port        = 22
}
