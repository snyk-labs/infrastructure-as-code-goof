resource "aws_security_group" "denied" {
  egress {
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "denied_2" {
  egress {
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["192.168.1.0/24"]
  }
}
