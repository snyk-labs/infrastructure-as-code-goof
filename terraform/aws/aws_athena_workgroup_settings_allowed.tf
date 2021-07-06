resource "aws_athena_workgroup" "allowed" {
}

resource "aws_athena_workgroup" "allowed_2" {
  configuration {}
}

resource "aws_athena_workgroup" "allowed_3" {
  configuration {
    enforce_workgroup_configuration = true
  }
}
