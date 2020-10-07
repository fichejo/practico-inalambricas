variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "federico"
}

variable "CIDR" {
  default = "172.16.0.0/16"
}

variable "subnet" {
  default = "172.16.1.0/24"
}

output "dns-publico" {
  value = aws_instance.terraform-inalambricas-instance.public_dns
}
