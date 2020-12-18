resource "aws_codebuild_project" "denied" {
  artifacts {
    type = "S3"
    encryption_disabled = true
  }
}

resource "aws_codebuild_project" "denied_2" {
  artifacts {
    type = "CODEPIPELINE"
    encryption_disabled = true
  }
}

resource "aws_codebuild_project" "denied_3" {
  artifacts {
    type = "CODEPIPELINE"
  }

  secondary_artifacts {
    type = "S3"
    encryption_disabled = true
  }
}

resource "aws_codebuild_project" "denied_4" {
  artifacts {
    type = "CODEPIPELINE"
  }

  secondary_artifacts = [
    {
      type = "S3"
      encryption_disabled = true
    }
  ]
}

resource "aws_codebuild_project" "denied_5" {
  artifacts {
    type = "CODEPIPELINE"
  }

  secondary_artifacts = [
    {
      type = "S3"
    },
    {
      type = "S3",
      encryption_disabled = true
    }
  ]
}
