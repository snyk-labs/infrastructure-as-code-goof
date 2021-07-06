resource "aws_elasticsearch_domain" "denied" {
  cluster_config {
    instance_type = "c5.large.elasticsearch"
  }
}

resource "aws_elasticsearch_domain" "denied_2" {
  cluster_config {
    instance_type = "c5.large.elasticsearch"
  }

  encrypt_at_rest {
    enabled = false
  }
}


