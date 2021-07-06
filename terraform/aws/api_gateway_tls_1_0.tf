resource "aws_api_gateway_domain_name" "denied" {
  certificate_arn = aws_acm_certificate_validation.example.certificate_arn
  domain_name     = "api.example.com"
  security_policy = "TLS_1_0"
}


