resource "aws_redshift_security_group" "redshift" {
  name = "redshift-sg"

  ingress {
    cidr = "10.0.0.0/24"
  }
}

resource "aws_db_security_group" "db" {
  name = "rds_sg"

  ingress {
    cidr = "10.0.0.0/24"
  }
}

resource "aws_elasticache_security_group" "elasticache" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.bar.name]
}
