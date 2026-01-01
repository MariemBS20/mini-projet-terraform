variable "eip_tag" {
    type = map(string)
    default = {
        Name = "eip"
    }
    description = "The tags for the Elastic IP."
  
}