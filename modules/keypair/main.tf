resource "tls_private_key" "keypair" {
    algorithm = "RSA"
    rsa_bits  = 4096
}
resource "local_file" "keypair_private_key" {
    filename = "../app/files/${var.key_name}.pem"
    content  = tls_private_key.keypair.private_key_pem
    file_permission = "0400"
}
resource "aws_key_pair" "keypair" {
    key_name   = var.key_name
    public_key = tls_private_key.keypair.public_key_openssh
}