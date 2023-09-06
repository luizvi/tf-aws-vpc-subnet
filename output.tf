# Output file

output "VPC_ID" {
  value = aws_vpc.oseg_Vpc_1.id
}

output "Instance_public_IP" {
  value = aws_instance.oseg_InstanceTest.public_ip
}