resource "aws_api_gateway_method" "denied" {
  http_method = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "denied_2" {
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "denied_3" {
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "denied_4" {
  http_method = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "denied_5" {
  http_method = "DELETE"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "denied_6" {
  http_method = "HEAD"
  authorization = "NONE"
}
