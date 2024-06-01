resource "aws_instance" "bastion" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.this.name]

  tags = {
    Name = "bastion-host"
  }
}
