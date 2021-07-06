resource "aws_elasticsearch_domain" "allowed" {
  domain_endpoint_options {
    enforce_https = true
  }
}
