resource "aws_globalaccelerator_accelerator" "allowed" {
  attributes {
    flow_logs_enabled = true
  }
}

resource "aws_globalaccelerator_accelerator" "denied" {
  attributes {
    flow_logs_enabled = false
  }
}

resource "aws_globalaccelerator_accelerator" "denied_2" {
}
