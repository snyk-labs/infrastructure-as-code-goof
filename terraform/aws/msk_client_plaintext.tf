resource "aws_msk_cluster" "client_both" {
  encryption_info {
    encryption_in_transit {
      client_broker = "TLS_PLAINTEXT"
    }
  }
}
