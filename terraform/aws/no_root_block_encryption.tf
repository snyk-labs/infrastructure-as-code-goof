resource "aws_spot_instance_request" "unencrypted" {
  ami           = "ami-1234"
  spot_price    = "0.03"
  instance_type = "c4.xlarge"

  root_block_device {
    encrypted = false
  }

  tags = {
    Name = "CheapWorker"
  }
}
