resource "aws_redshift_cluster" "allowed" {
  encrypted = true
  logging {
    enabled = true
  }
}

resource "aws_redshift_cluster" "denied" {
  encrypted = true
  logging {
    enabled = false
  }
}

resource "aws_redshift_cluster" "denied_2" {
  encrypted = true
}
