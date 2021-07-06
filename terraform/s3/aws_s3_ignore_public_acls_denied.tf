resource "aws_s3_bucket_public_access_block" "denied" {
}

resource "aws_s3_bucket_public_access_block" "denied_2" {
  ignore_public_acls = false
}
