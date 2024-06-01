module "networking" {
  source = "./networking"

  region   = var.region
  vpc_cidr = var.vpc_cidr
}

module "bastion" {
  source = "./bastion"

  vpc_id = module.networking.vpc_id
  subnet_id = module.networking.subnet_id_dmz
  egress_cidr = module.networking.cidr_frontend

  ami = data.aws_ssm_parameter.ubuntu_ami
}
