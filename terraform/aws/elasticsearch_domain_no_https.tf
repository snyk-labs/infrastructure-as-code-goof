resource "aws_elasticsearch_domain" "denied" {
}

resource "aws_elasticsearch_domain" "denied_2" {
  domain_endpoint_options {
    enforce_https = false
  }
}
