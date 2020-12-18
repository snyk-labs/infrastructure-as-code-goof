resource "aws_lambda_function" "allowed" {
}

resource "aws_lambda_function" "allowed_2" {
  environment {
    variables = {
      foo = "bar"
    }
  }
}
