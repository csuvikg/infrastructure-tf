output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_id_dmz" {
  value = aws_subnet.dmz.id
}

output "subnet_id_frontend" {
  value = aws_subnet.frontend.id
}

output "subnet_id_backend" {
  value = aws_subnet.backend.id
}

output "cidr_dmz" {
  value = aws_subnet.dmz.cidr_block
}

output "cidr_frontend" {
  value = aws_subnet.frontend.cidr_block
}

output "cidr_backend" {
  value = aws_subnet.backend.cidr_block
}
