resource "aws_cloudwatch_log_group" "allowed" {
  retention_in_days = 0
}

resource "aws_cloudwatch_log_group" "allowed_2" {
  retention_in_days = 365
}

resource "aws_cloudwatch_log_group" "denied" {
}
