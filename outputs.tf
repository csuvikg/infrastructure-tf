output "bastion_ip" {
  value = module.bastion.bastion_ip
}

output "elb_address" {
  value = module.server.elb_address
}
