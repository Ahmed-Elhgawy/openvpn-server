output "instance_public_ip" {
  value = aws_instance.ubuntu-server.public_ip
}