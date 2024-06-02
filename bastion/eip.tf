resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "bastion-eip"
  }
}

resource "aws_eip_association" "this" {
  instance_id   = aws_instance.this.id
  allocation_id = aws_eip.this.id
}
