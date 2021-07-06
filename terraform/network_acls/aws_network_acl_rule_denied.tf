resource "aws_network_acl_rule" "denied" {
  network_acl_id = aws_network_acl.bar.id
  rule_number    = 200
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}
