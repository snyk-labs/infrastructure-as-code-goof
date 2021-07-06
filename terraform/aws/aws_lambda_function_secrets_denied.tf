resource "aws_lambda_function" "denied" {
  environment {
    variables = {
      password = "SECRET_PASS" 
    }
  }
}

resource "aws_lambda_function" "denied_2" {
  environment {
    variables = {
      private_key = "SECRET_PASS" 
    }
  }
}

resource "aws_lambda_function" "denied_3" {
  environment {
    variables = {
      aws_access_key_id = "SECRET_PASS" 
    }
  }
}

resource "aws_lambda_function" "denied_4" {
  environment {
    variables = {
      token = "SECRET_PASS" 
    }
  }
}

resource "aws_lambda_function" "denied_5" {
  environment {
    variables = {
      foo = "bar"
      api_key = "SECRET_PASS" 
    }
  }
}

resource "aws_lambda_function" "denied_6" {
  environment {
    variables = {
      aws_secret_access_key = "SECRET_PASS" 
      secret = "SECRET_PASS"
    }
  }
}
