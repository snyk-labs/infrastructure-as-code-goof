resource "aws_cloudtrail" "allowed" {
  enable_log_file_validation = true
  is_multi_region_trail      = true
  cloud_watch_logs_group_arn = "arn:1234"
  kms_key_id                 = "arn:124"
}

resource "aws_cloudtrail" "denied" {
  enable_log_file_validation = true
  cloud_watch_logs_group_arn = "arn:1234"
  kms_key_id                 = "arn:124"
}

resource "aws_cloudtrail" "denied_2" {
  enable_log_file_validation = true
  is_multi_region_trail      = false
  cloud_watch_logs_group_arn = "arn:1234"
  kms_key_id                 = "arn:124"
}
