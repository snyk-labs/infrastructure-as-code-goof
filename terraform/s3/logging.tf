resource "aws_s3_bucket" "logging" {
  bucket = "logging"
  logging {
    target_bucket = "no_logging"
  }
}
