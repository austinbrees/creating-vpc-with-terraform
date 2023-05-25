module "vpc" {
  source = "/home/student_03_ebb8073f584c/group-work/terraform/network/vpc"
}

module "firewall" {
  source = "/home/student_03_ebb8073f584c/group-work/terraform/network/firewall"
  depends_on = [module.vpc]
}

module "management_instance" {
  source = "/home/student_03_ebb8073f584c/group-work/terraform/instances/management_instance"
  depends_on = [module.firewall]
}

module "private_instance" {
  source = "/home/student_03_ebb8073f584c/group-work/terraform/instances/private_instance"
  depends_on = [module.firewall]
}

module "appliance_instance" {
  source = "/home/student_03_ebb8073f584c/group-work/terraform/instances/appliance_instance"
  depends_on = [module.firewall]
}
