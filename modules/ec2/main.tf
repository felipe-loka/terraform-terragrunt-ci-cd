resource "aws_instance" "myec2" {
  ami           = "ami-05b10e08d247fb927"
  instance_type    = var.instance_type
}
