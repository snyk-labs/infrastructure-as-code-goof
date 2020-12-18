resource "aws_instance" "encrypted" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_launch_configuration" "encrypted" {
  name          = "web_config"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  root_block_device {
    encrypted = true
  }
}

resource "aws_spot_fleet_request" "encrypted" {
  iam_fleet_role      = "arn:aws:iam::12345678:role/spot-fleet"
  launch_specification {
    root_block_device {
      encrypted = true
    }
  }
}

resource "aws_spot_instance_request" "encrypted" {
  ami           = "ami-1234"
  spot_price    = "0.03"
  instance_type = "c4.xlarge"

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "CheapWorker"
  }
}
