resource "aws_ecs_cluster" "denied" {
}

resource "aws_ecs_cluster" "denied_2" {
  setting {
    name = "containerInsights"
    value = "disabled"
  }
}

resource "aws_ecs_cluster" "denied_3" {
  setting {
    name = "containerInsights"
    value = "disabled"
  }

  setting {
    name = "someOtherValue"
    value = "disabled"
  }
}
