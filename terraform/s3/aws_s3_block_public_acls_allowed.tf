resource "aws_s3_bucket_public_access_block" "allowed" {
  block_public_acls = true
}
