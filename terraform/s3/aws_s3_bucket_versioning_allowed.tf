resource "aws_s3_bucket" "allowed" {
  versioning {
    enabled = true
  }
}
