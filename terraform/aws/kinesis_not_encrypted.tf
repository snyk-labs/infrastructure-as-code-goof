resource "aws_kinesis_stream" "denied" {
  name             = "terraform-kinesis-test"
  encryption_type  = "NONE"
}

resource "aws_kinesis_stream" "denied_2" {
  name             = "terraform-kinesis-test"
}
