variable "instance_type" {
    type        = string
    default     = "t2.medium"
    description = "Instance type of the EC2 instance."
}

variable "key_name" {
    type        = string
    default     = "projet-terraform"
    description = "Key pair  for the EC2 instance."
  
}
variable "tags" {
    type        = map(string)
    default     = {
      Name = "ec2-instance"
    }
    description = "The tags for the EC2 instance."
  
}
variable "security_group_name" {
    type        = string
    default = "security_group"
    description = "The name of the security group to associate with the EC2 instance."
    
  
}
variable "user" {
    type        = string
    default     = "ubuntu"
    description = "User for the EC2 instance."
}
variable "availability_zone" {

  
}
