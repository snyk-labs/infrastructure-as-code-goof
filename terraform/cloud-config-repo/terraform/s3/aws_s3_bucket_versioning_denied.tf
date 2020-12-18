resource "aws_s3_bucket" "denied" {
}

resource "aws_s3_bucket" "denied_2" {
  versioning {}
}

resource "aws_s3_bucket" "denied_3" {
  versioning {
    enabled = false
  }
}
