resource "aws_cloudtrail" "allowed" {
  cloud_watch_logs_group_arn = "some-arn:*"
  kms_key_id                 = "arn:1234"
  enable_log_file_validation = true
  is_multi_region_trail      = true
}

resource "aws_cloudtrail" "denied" {
  kms_key_id                 = "arn:1234"
  enable_log_file_validation = true
  is_multi_region_trail      = true
}
