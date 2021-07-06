resource "aws_api_gateway_stage" "denied" {
}

resource "aws_api_gateway_stage" "denied_2" {
  xray_tracing_enabled = false
}
