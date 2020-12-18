resource "aws_s3_bucket_public_access_block" "allowed" {
  restrict_public_buckets = true
}
