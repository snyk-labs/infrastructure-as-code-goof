resource "aws_instance" "allowed" {
  metadata_options {
    http_tokens = "required"
  }
}

resource "aws_instance" "allowed_2" {
  metadata_options {
    http_endpoint = "disabled"
  }
}

resource "aws_instance" "allowed_3" {
  metadata_options {
    http_endpoint = "disabled"
    http_tokens = "optional"
  }
}
