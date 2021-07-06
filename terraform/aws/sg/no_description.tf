resource "aws_security_group" "sg" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.main.id
}
