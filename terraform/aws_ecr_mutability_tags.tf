resource "aws_ecr_repository" "allowed" {
  image_scanning_configuration {
    scan_on_push = true
  }
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "denied" {
  image_scanning_configuration {
    scan_on_push = true
  }
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "denied_2" {
  image_scanning_configuration {
    scan_on_push = true
  }
}
