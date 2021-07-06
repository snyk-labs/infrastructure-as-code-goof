resource "aws_security_group" "allow_udp" {
  name        = "allow_udp"
  description = "Allow UDP inbound from anywhere"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
