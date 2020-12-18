resource "aws_codebuild_project" "allowed" {
  artifacts {
    type = "NO_ARTIFACTS"
  }
}

resource "aws_codebuild_project" "allowed_2" {
  artifacts {
    type = "S3"
  }
}

resource "aws_codebuild_project" "allowed_3" {
  artifacts {
    type = "CODEPIPELINE"
    encryption_disabled = false
  }
}

resource "aws_codebuild_project" "allowed_4" {
  artifacts {
    type = "CODEPIPELINE"
    encryption_disabled = false
  }
}

resource "aws_codebuild_project" "allowed_5" {
  artifacts {
    type = "CODEPIPELINE"
    encryption_disabled = false
  }

  secondary_artifacts {
    type = "S3"
  }
}

resource "aws_codebuild_project" "allowed_6" {
  artifacts {
    type = "CODEPIPELINE"
    encryption_disabled = false
  }

  secondary_artifacts {
    type = "NO_ARTIFACTS"
    encryption_disabled = true
  }
}

resource "aws_codebuild_project" "allowed_7" {
  artifacts {
    type = "CODEPIPELINE"
    encryption_disabled = false
  }

  secondary_artifacts = [
    {
      type = "S3"
    },
    {
      type = "S3"
      encryption_disabled = false
    }
  ]
}

resource "aws_codebuild_project" "allowed_8" {
  artifacts {
    type = "CODEPIPELINE"
    encryption_disabled = false
  }

  secondary_artifacts = [
    {
      type = "S3"
    },
    {
      type = "NO_ARTIFACTS"
      encryption_disabled = true
    },
    {
      type = "S3"
      encryption_disabled = false
    }
  ]
}
