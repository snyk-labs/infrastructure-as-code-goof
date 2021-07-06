resource "aws_elasticsearch_domain" "allowed" {
  cluster_config {
    instance_type = "c5.large.elasticsearch"
  }
  encrypt_at_rest {
    enabled = true
  }
}
