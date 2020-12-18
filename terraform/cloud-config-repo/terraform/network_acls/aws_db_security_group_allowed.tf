resource "aws_db_security_group" "allowed" {
  name = "rds_sg"
  ingress {
    cidr = "1.0.0.0/0"
  }
}
