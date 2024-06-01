resource "aws_security_group" "server" {
  vpc_id = var.vpc_id

  ingress {
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.egress_cidr]
  }

  tags = {
    Name = "server-sg"
  }
}

resource "aws_security_group" "lb" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.external_port
    to_port     = var.external_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr]
  }

  egress {
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = [var.server_subnet_cidr]
  }

  tags = {
    Name = "lb-sg"
  }
}
