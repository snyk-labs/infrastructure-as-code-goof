resource "aws_s3_bucket" "without_server_side_encryption_configuration" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "without_rule" {
  bucket = "mybucket"

  server_side_encryption_configuration {
  }
}

resource "aws_s3_bucket" "without_apply_server_side_encryption_by_default" {
  bucket = "mybucket"

  server_side_encryption_configuration {
    rule {
    }
  }
}

resource "aws_s3_bucket" "without_sse_algorithm" {
  bucket = "mybucket"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.mykey.arn}"
      }
    }
  }
}
