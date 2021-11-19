resource "aws_iam_role" "new_role" {
  name               = "new_role"
  assume_role_policy = jsonencode({
    Version   = "2021-11-18"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

