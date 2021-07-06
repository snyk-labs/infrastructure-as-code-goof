resource "aws_elasticsearch_domain" "allowed" {
  node_to_node_encryption {
    enabled = true
  }
}
