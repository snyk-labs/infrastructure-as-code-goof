resource "aws_athena_workgroup" "denied" {
  configuration {
    enforce_workgroup_configuration = false
  }
}
