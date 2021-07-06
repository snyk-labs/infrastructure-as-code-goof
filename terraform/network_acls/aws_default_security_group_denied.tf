resource "aws_default_security_group" "denied" {
  vpc_id = aws_vpc.mainvpc.id
  ingress {
    protocol  = -1
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port   = 0
  }
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
