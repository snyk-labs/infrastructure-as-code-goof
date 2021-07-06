resource "aws_redshift_security_group" "allowed" {
  name = "redshift-sg"
  ingress {
    cidr = "1.0.0.0/0"
  }
}
