resource "aws_api_gateway_stage" "allowed" {
  xray_tracing_enabled = true
}
