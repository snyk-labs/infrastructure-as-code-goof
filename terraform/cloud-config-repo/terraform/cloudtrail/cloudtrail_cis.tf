resource "aws_cloudtrail" "insecure" {
  name           = "insecure"
  s3_bucket_name = "bucket"
  enable_logging = false
}

