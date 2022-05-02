terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  shared_credentials_file = "/Users/{user}/.aws/{credentials-file}"
}

resource "aws_instance" "ubuntu-by-tf-1" {
    ami = "ami-00c90dbdc12232b58"
    instance_type = "t2.micro"
    tags = {
      Name = "ubuntu-via-tf-3"
    }
}

resource "aws_vpc" "vpc-by-tf-1" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "vpc-tf-2"
  }
}

resource "aws_subnet" "subnet-by-tf-1" {
  vpc_id = aws_vpc.vpc-by-tf-1.id
  cidr_block = "172.16.0.0/24"
  tags = {
    Name = "subnet-tf-2"
  }
}
