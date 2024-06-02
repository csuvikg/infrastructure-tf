data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/20.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}

module "networking" {
  source = "./networking"

  region   = var.region
  vpc_cidr = var.vpc_cidr
}

module "key" {
  source = "./key"
}

module "bastion" {
  source = "./bastion"

  # Networking
  vpc_id      = module.networking.vpc_id
  subnet_id   = module.networking.subnet_id_dmz_1
  egress_cidr = module.networking.cidr_frontend_1

  # Instance
  ami      = data.aws_ssm_parameter.ubuntu_ami.insecure_value
  key_name = module.key.aws_key_name
}

module "database" {
  source = "./database"

  # Networking
  vpc_id       = module.networking.vpc_id
  subnet_ids   = [module.networking.subnet_id_backend_1, module.networking.subnet_id_backend_2]
  ingress_cidr = module.networking.cidr_frontend_1

  # Instance
  db_username = var.db_username
  db_password = var.db_password
}

module "server" {
  source = "./server"

  # Networking
  vpc_id             = module.networking.vpc_id
  elb_subnet_ids     = [module.networking.subnet_id_dmz_1, module.networking.subnet_id_dmz_2]
  server_subnet_id   = module.networking.subnet_id_frontend_1
  server_subnet_cidr = module.networking.cidr_frontend_1

  # Instance
  ami      = data.aws_ssm_parameter.ubuntu_ami.insecure_value
  key_name = module.key.aws_key_name
}
