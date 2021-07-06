resource "aws_msk_cluster" "default" {
}

resource "aws_msk_cluster" "client_tls" {
  encryption_info {
    encryption_in_transit {
      client_broker = "TLS"
    }
  }
}

resource "aws_msk_cluster" "tls" {
  encryption_info {
  }
}

resource "aws_msk_cluster" "in_cluster" {
  encryption_info {
    encryption_in_transit {
      in_cluster = true
    }
  }
}



