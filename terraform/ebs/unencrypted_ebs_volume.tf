resource "aws_ebs_volume" "example_volume_unencrypted" {
  availability_zone = "us-west-2a"
  size              = 40
  description       = "Disable default encryption on the EBS volume"
  encrypted         = false
}
