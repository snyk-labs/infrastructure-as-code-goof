resource "aws_kms_key" "without-rotation" {
}

resource "aws_kms_key" "with-rotation" {
  enable_key_rotation      = true
}
