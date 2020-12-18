resource "aws_api_gateway_method" "allowed" {
  http_method = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "allowed_2" {
  http_method = "ANY"
  authorization = "CUSTOM"
}

resource "aws_api_gateway_method" "allowed_3" {
  http_method = "GET"
  authorization = "AWS_IAM"
}
