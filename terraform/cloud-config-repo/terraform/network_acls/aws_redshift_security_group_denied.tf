resource "aws_redshift_security_group" "denied" {
  name = "redshift-sg"
  ingress {
    cidr = "0.0.0.0/0"
  }
  ingress {
    cidr = "1.0.0.0/0"
  }
}
