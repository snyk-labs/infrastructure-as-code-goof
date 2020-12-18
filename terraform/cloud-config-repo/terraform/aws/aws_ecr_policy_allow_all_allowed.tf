resource "aws_ecr_repository_policy" "allowed" {
  repository = aws_ecr_repository.foo.name

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": {
              "AWS": "arn:aws:iam::*:role/AdminRole"
            },
            "Action": [
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
EOF
}

resource "aws_ecr_repository_policy" "allowed_2" {
  repository = aws_ecr_repository.foo.name

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Deny",
            "Principal": "*",
            "Action": [
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
EOF
}
