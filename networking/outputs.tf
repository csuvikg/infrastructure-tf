output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_id_dmz_1" {
  value = aws_subnet.dmz_1.id
}

output "subnet_id_dmz_2" {
  value = aws_subnet.dmz_2.id
}

output "subnet_id_frontend_1" {
  value = aws_subnet.frontend_1.id
}

output "subnet_id_frontend_2" {
  value = aws_subnet.frontend_2.id
}

output "subnet_id_backend_1" {
  value = aws_subnet.backend_1.id
}

output "subnet_id_backend_2" {
  value = aws_subnet.backend_2.id
}

output "cidr_dmz_1" {
  value = aws_subnet.dmz_1.cidr_block
}

output "cidr_dmz_2" {
  value = aws_subnet.dmz_2.cidr_block
}

output "cidr_frontend_1" {
  value = aws_subnet.frontend_1.cidr_block
}

output "cidr_frontend_2" {
  value = aws_subnet.frontend_2.cidr_block
}

output "cidr_backend_1" {
  value = aws_subnet.backend_1.cidr_block
}

output "cidr_backend_2" {
  value = aws_subnet.backend_2.cidr_block
}
