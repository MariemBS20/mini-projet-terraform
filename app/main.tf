module "keypair" {
  source = "../modules/keypair"

  key_name = var.key_name
  
}
module "sg" {
  source = "../modules/sg"
  
  security_group_name = var.security_group_name
  security_group_tag  = var.security_group_tag

}

module "ec2" {
  source = "../modules/ec2"

  instance_type = var.instance_type

  key_name      = var.key_name
  security_group_name = module.sg.security_group_name
  tags = var.instance_tag
  user          = var.user
  availability_zone = module.ebs.ebs_zone
}

module "eip" {
  source = "../modules/eip"

  eip_tag = var.eip_tag
  
}

module "ebs" {
  source = "../modules/ebs"

  ebs_size = var.ebs_size
  ebs_zone = var.ebs_zone
  ebs_tag  = var.ebs_tag
  
}
resource "aws_volume_attachment" "ebs_attachement" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.ebs_id
  instance_id = module.ec2.ec2_id
}

resource "aws_eip_association" "eip_association" {
  instance_id   = module.ec2.ec2_id
  allocation_id = module.eip.eip_id

  
}