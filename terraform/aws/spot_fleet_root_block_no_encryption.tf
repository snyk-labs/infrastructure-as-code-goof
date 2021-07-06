resource "aws_spot_fleet_request" "unencrypted" {
  iam_fleet_role      = "arn:aws:iam::12345678:role/spot-fleet"
  launch_specification {
    root_block_device {
      encrypted = false
    }
  }
}
