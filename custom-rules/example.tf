resource "aws_redshift_cluster" "test" {
  cluster_identifier = "tf-redshift-cluster"
  node_type          = "dc1.large"
}
