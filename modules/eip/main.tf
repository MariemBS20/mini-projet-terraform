resource "aws_eip" "eip" {
   #domain = "vpc"
    provisioner "local-exec" {
        command = "echo  The public IP Address is ${aws_eip.eip.public_ip} >> ip_ec2.txt"
      
    }
    tags = var.eip_tag

}