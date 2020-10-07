resource "aws_security_group" "sec-grp_inalambricas" {
  name   = "sec-grp_inalambricas"
  vpc_id = aws_vpc.inalambricas-vpc.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
