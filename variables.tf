# Variables file

variable "region" {
  description = "AWS Region to operate"
  default = "us-east-2"
}

variable "vpc_CIDR" {
  description = "CIDR block to use in VPC"
  default = "10.0.0.0/16"
}

variable "public_CIDR" {
  description = "CIDR public block"
  default = "10.0.0.0/24"
}

variable "instance_tenancy" {
  default = "default"
}