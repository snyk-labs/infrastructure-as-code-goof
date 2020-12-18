resource "aws_lambda_function" "denied" {
}

resource "aws_lambda_function" "allowed" {
  tracing_config {
    mode = "PassThrough"
  }
}

resource "aws_lambda_function" "allowed_2" {
  tracing_config {
    mode = "Active"
  }
}
