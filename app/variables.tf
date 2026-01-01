variable "security_group_name" {
  type        = string
  default     = "security_group"
  description = "The name of the security group to associate with the EC2 instance."


}
variable "security_group_tag" {

}
variable "instance_type" {


}
variable "key_name" {
  type        = string
  default     = "projet-terraform"
  description = "Key pair  for the EC2 instance."

}
variable "instance_tag" {
  type = map(string)
  default = {
    Name = "ec2-instance"
  }
  description = "The tags for the EC2 instance."

}
variable "user" {
  type        = string
  default     = "ubuntu"
  description = "User for the EC2 instance."
}

variable "ebs_zone" {
  type        = string
  default     = "us-east-1a"
  description = "The availability zone of the EBS volume."

}
variable "ebs_size" {
  type        = number
  default     = 8
  description = "The size of the EBS volume in GiB."

}
variable "ebs_tag" {

}

variable "eip_tag" {

}