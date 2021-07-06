resource "aws_cloudfront_distribution" "cloudfront" {
  viewer_certificate {
    cloudfront_default_certificate = false
    minimum_protocol_version = "TLSv1"
    ssl_support_method = "sni-only"
  }
}
