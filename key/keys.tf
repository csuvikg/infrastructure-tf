resource "tls_private_key" "this" {
  count    = local.create_key ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  count    = local.create_key ? 1 : 0
  content  = tls_private_key.this[0].private_key_pem
  filename = "${path.module}/private_key.pem"
  file_permission = "600"
}

resource "local_file" "public_key" {
  count    = local.create_key ? 1 : 0
  content  = tls_private_key.this[0].public_key_openssh
  filename = "${path.module}/public_key.pub"
  file_permission = "644"
}

data "local_file" "provided_public_key" {
  count    = local.create_key ? 0 : 1
  filename = var.public_key_path
}

resource "aws_key_pair" "this" {
  key_name   = "deployer-key"
  public_key = local.create_key ? tls_private_key.this[0].public_key_openssh : data.local_file.provided_public_key[0].content
}
