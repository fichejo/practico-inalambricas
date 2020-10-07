resource "aws_instance" "terraform_instalambricas_inst" {
  ami           = "ami-0817d428a6fb68645"
  instance_type = "t2.micro"
  key_name      = "fferreira-key"
  vpc_security_group_ids = [aws_security_group.sec-grp_inalambricas.id,
  ]
  subnet_id = aws_subnet.inalambricas-private-subnet.id
  tags = {
    Name = "terraform_instalambricas_inst"
  }

  connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("/home/fx/.ssh/fferreira-key.pem")
      host = self.public_ip
      }
      provisioner "remote-exec" {
          inline = [
            "sudo apt update -y",
            "sudo apt install -y ca-certificates wget",
            "wget https://get.glennr.nl/unifi/install/unifi-5.13.32.sh",
          ]
          on_failure = continue
      }
}
