resource "aws_elasticsearch_domain" "allowed" {
  domain_endpoint_options {
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
    enforce_https       = true
  }
  cluster_config {
    instance_type = "c5.large.elasticsearch"
  }
  encrypt_at_rest {
    enabled = true
  }
  node_to_node_encryption {
    enabled = true
  }
  log_publishing_options {
  }
}

resource "aws_elasticsearch_domain" "allowed_2" {
  domain_endpoint_options {
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
    enforce_https       = true
  }
  node_to_node_encryption {
    enabled = true
  }
  cluster_config {
    instance_type = "c5.large.elasticsearch"
  }
  encrypt_at_rest {
    enabled = true
  }
  log_publishing_options {
    enabled = true
  }
}

resource "aws_elasticsearch_domain" "allowed_3" {
  domain_endpoint_options {
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
    enforce_https       = true
  }
  node_to_node_encryption {
    enabled = true
  }
  cluster_config {
    instance_type = "c5.large.elasticsearch"
  }
  encrypt_at_rest {
    enabled = true
  }
  log_publishing_options {
    enabled = false
  }

  log_publishing_options {
    enabled = true
  }
}

resource "aws_elasticsearch_domain" "allowed_4" {
  domain_endpoint_options {
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
    enforce_https       = true
  }
  node_to_node_encryption {
    enabled = true
  }
  cluster_config {
    instance_type = "c5.large.elasticsearch"
  }
  encrypt_at_rest {
    enabled = true
  }
  log_publishing_options {
    enabled = false
  }

  log_publishing_options {
    enabled = false
  }

  log_publishing_options {}
}

resource "aws_elasticsearch_domain" "denied" {
  domain_endpoint_options {
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
    enforce_https       = true
  }
  node_to_node_encryption {
    enabled = true
  }
  cluster_config {
    instance_type = "c5.large.elasticsearch"
  }
  encrypt_at_rest {
    enabled = true
  }
  log_publishing_options {
    enabled = false
  }
}

resource "aws_elasticsearch_domain" "denied_2" {
  domain_endpoint_options {
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
    enforce_https       = true
  }
  node_to_node_encryption {
    enabled = true
  }
  cluster_config {
    instance_type = "c5.large.elasticsearch"
  }
  encrypt_at_rest {
    enabled = true
  }
}


