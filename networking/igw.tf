resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "dmz" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "dmz-public-route-table"
  }
}

resource "aws_route_table_association" "dmz_1" {
  subnet_id      = aws_subnet.dmz_1.id
  route_table_id = aws_route_table.dmz.id
}

resource "aws_route_table_association" "dmz_2" {
  subnet_id      = aws_subnet.dmz_2.id
  route_table_id = aws_route_table.dmz.id
}
