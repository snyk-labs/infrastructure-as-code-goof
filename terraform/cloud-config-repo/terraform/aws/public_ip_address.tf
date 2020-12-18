resource "aws_instance" "public" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  associate_public_ip_address = true

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_launch_configuration" "public" {
  name          = "web_config"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
}

resource "aws_launch_template" "public" {
  name = "foo"

  network_interfaces {
    associate_public_ip_address = true
  }
}

resource "aws_spot_fleet_request" "public" {
  iam_fleet_role      = "arn:aws:iam::12345678:role/spot-fleet"

  launch_specification {
    associate_public_ip_address = true
  }
}
