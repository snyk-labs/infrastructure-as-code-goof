resource "aws_elasticsearch_domain" "denied" {
}

resource "aws_elasticsearch_domain" "denied_2" {
  cluster_config {
    instance_type = "t2.micro.elasticsearch"
  }
}
