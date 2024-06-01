resource "aws_db_subnet_group" "this" {
  name       = "database-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "this" {
  allocated_storage      = var.db_volume_size_gb
  engine                 = var.db_type
  engine_version         = var.db_version
  instance_class         = var.db_instance_type
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.${var.db_type}${var.db_version}"
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]
  skip_final_snapshot    = true

  tags = {
    Name = "db-instance"
  }
}
