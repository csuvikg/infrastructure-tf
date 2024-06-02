resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.server_subnet_id
  vpc_security_group_ids = [aws_security_group.server.id]
  key_name               = var.key_name

  tags = {
    Name = "server"
  }
}
