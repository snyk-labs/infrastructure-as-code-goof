resource "aws_api_gateway_stage" "allowed" {
  xray_tracing_enabled = true
  access_log_settings {
  }
}

resource "aws_api_gateway_stage" "denied" {
  xray_tracing_enabled = true
}

resource "aws_apigatewayv2_stage" "allowed" {
  access_log_settings {
  }
}

resource "aws_apigatewayv2_stage" "denied" {
}
