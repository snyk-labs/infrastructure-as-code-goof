resource "aws_security_group" "allowed" {
  egress {
    cidr_blocks = ["192.168.1.0/24"]
  }
}

resource "aws_security_group" "allowed_2" {
  egress {
    cidr_blocks = ["10.0.0.0/24"]
  }
  egress {
    cidr_blocks = ["192.168.1.0/24"]
  }
}
