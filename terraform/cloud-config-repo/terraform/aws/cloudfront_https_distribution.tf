resource "aws_cloudfront_distribution" "cloudfront" {
  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
  }
}
