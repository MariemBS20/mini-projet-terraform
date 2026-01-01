variable "security_group_name" {
    type        = string
    default = "security_group"
    description = "The name of the security group to associate with the EC2 instance."
    
  
}
variable "security_group_tag" {
  type        = map
  default     = {
    Name = "security_group"
  }
  description = "The tags for the security group."
}