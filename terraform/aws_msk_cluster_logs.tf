resource "aws_msk_cluster" "allowed" {
  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled = true
      }
    }
  }
}

resource "aws_msk_cluster" "allowed_2" {
  logging_info {
    broker_logs {
      firehose {
        enabled = true
      }
    }
  }
}

resource "aws_msk_cluster" "allowed_3" {
  logging_info {
    broker_logs {
      s3 {
        enabled = true
      }
    }
  }
}

resource "aws_msk_cluster" "allowed_4" {
  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled = false
      }
      s3 {
        enabled = true
      }
    }
  }
}

resource "aws_msk_cluster" "denied" {
}


resource "aws_msk_cluster" "denied_2" {
  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled = false
      }
    }
  }
}

resource "aws_msk_cluster" "denied_3" {
  logging_info {
    broker_logs {
      firehose {
        enabled = false
      }
    }
  }
}

resource "aws_msk_cluster" "denied_4" {
  logging_info {
    broker_logs {
      s3 {
        enabled = false
      }
    }
  }
}

resource "aws_msk_cluster" "denied_5" {
  logging_info {
    broker_logs {
      cloudwatch_logs {
      }
    }
  }
}

resource "aws_msk_cluster" "denied_6" {
  logging_info {
    broker_logs {
    }
  }
}


