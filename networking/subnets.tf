resource "aws_subnet" "dmz_1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 0)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "dmz-public-subnet-1"
  }
}

resource "aws_subnet" "dmz_2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 1)
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "dmz-public-subnet-2"
  }
}

resource "aws_subnet" "backend_1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 2)
  availability_zone = "${var.region}a"

  tags = {
    Name = "backend-private-subnet-1"
  }
}

resource "aws_subnet" "backend_2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 3)
  availability_zone = "${var.region}b"

  tags = {
    Name = "backend-private-subnet-2"
  }
}

resource "aws_subnet" "frontend_1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 4)
  availability_zone = "${var.region}a"

  tags = {
    Name = "frontend-private-subnet-1"
  }
}

resource "aws_subnet" "frontend_2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 5)
  availability_zone = "${var.region}b"

  tags = {
    Name = "frontend-private-subnet-2"
  }
}
