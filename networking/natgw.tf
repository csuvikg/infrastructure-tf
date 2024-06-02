resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "main-nat-eip"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.dmz_1.id

  tags = {
    Name = "main-nat-gateway"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "backend_1" {
  subnet_id      = aws_subnet.backend_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "backend_2" {
  subnet_id      = aws_subnet.backend_2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "frontend_1" {
  subnet_id      = aws_subnet.frontend_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "frontend_2" {
  subnet_id      = aws_subnet.frontend_2.id
  route_table_id = aws_route_table.private.id
}
