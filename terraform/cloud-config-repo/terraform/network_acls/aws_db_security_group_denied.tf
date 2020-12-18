resource "aws_db_security_group" "denied" {
  name = "rds_sg"
  ingress {
    cidr = "0.0.0.0/0"
  }
  ingress {
    cidr = "1.0.0.0/0"
  }
}
