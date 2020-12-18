resource "aws_elasticache_replication_group" "denied" {
}

resource "aws_elasticache_replication_group" "denied_2" {
  at_rest_encryption_enabled = false
}

