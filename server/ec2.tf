resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.server_subnet_id
  security_groups = [aws_security_group.server.name]

  tags = {
    Name = "server"
  }
}
