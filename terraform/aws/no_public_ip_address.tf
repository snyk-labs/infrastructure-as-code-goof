resource "aws_instance" "private" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  associate_public_ip_address = false

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_launch_configuration" "private" {
  name          = "web_config"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

resource "aws_launch_template" "private" {
  name = "foo"

  network_interfaces {
    associate_public_ip_address = false
  }
}

resource "aws_spot_fleet_request" "private" {
  iam_fleet_role      = "arn:aws:iam::12345678:role/spot-fleet"

  launch_specification {
  }
}
