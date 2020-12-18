resource "aws_instance" "denied" {
}

resource "aws_instance" "denied_2" {
  metadata_options {
    http_endpoint = "enabled"
  }
}

resource "aws_instance" "denied_3" {
  metadata_options {
    http_endpoint = "enabled"
    http_tokens = "optional"
  }
}
