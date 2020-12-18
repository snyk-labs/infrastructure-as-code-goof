resource "aws_docdb_cluster" "allowed" {
  enabled_cloudwatch_logs_exports = ["profiler", "audit"]
  storage_encrypted               = true
}

resource "aws_docdb_cluster" "denied" {
  enabled_cloudwatch_logs_exports = ["profiler"]
  storage_encrypted               = true
}

resource "aws_docdb_cluster" "denied_2" {
  enabled_cloudwatch_logs_exports = ["audit"]
  storage_encrypted               = true
}

resource "aws_docdb_cluster" "denied_3" {
  storage_encrypted = true
}

resource "aws_docdb_cluster" "denied_4" {
  storage_encrypted               = true
  enabled_cloudwatch_logs_exports = []
}
