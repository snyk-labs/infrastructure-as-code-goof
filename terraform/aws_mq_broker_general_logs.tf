resource "aws_mq_broker" "allowed" {
  logs {
    general = true
  }
}

resource "aws_mq_broker" "denied" {
}

resource "aws_mq_broker" "denied_2" {
  logs {
  }
}

resource "aws_mq_broker" "denied_3" {
  logs {
    general = false
  }
}
