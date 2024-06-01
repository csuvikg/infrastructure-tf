resource "aws_subnet" "dmz" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 0)
  availability_zone = "${var.region}a"

  tags = {
    Name = "dmz-public-subnet"
  }
}

resource "aws_subnet" "backend" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 1)
  availability_zone = "${var.region}a"

  tags = {
    Name = "backend-private-subnet"
  }
}

resource "aws_subnet" "frontend" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 2)
  availability_zone = "${var.region}a"

  tags = {
    Name = "frontend-private-subnet"
  }
}
