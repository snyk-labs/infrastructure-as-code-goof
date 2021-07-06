resource "aws_sns_topic" "sns" {
  name              = "user-updates-topic"
  kms_master_key_id = "alias/aws/sns"
}
