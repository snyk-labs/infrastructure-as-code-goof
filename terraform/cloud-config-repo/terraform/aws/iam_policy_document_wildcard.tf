data "aws_iam_policy_document" "denied" {
  statement {
    sid = "1"

    actions = [
      "*"
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}
