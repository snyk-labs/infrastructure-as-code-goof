resource "aws_kinesis_stream" "allowed" {
  name             = "terraform-kinesis-test"
  encryption_type  = "KMS"
}
