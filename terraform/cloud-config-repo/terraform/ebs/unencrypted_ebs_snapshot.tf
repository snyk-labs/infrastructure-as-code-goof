resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 40
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = "${aws_ebs_volume.example.id}"
}

resource "aws_ebs_snapshot" "example_snapshot_unencrypted" {
  source_snapshot_id = "${aws_ebs_snapshot.example_snapshot.id}"
  source_region      = "us-west-2"
  description        = "Disable default encryption on the EBS snapshot"
  encrypted          = false
}
