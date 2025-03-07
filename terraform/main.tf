resource "aws_instance" "myec2" {
  ami           = "ami-05b10e08d247fb927"
  instance_type = "t3.micro"
  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_size           = 5
    volume_type           = "gp2"
    delete_on_termination = false
    encrypted             = true
  }
}
