provider "aws" {
    access_key = "Access Key"
secret_key = "Secret Key"
region = "us-east-2"
}

# we need to create a vpc resource
resource "aws_vpc" "ntiervpc" {
    cidr_block = "192.168.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
      "Name" = "from tf"
    }
  
}

# Lets create a subnet
resource "aws_subnet" "web1" {
  vpc_id = aws_vpc.ntiervpc.id
  cidr_block = "192.168.0.0/24"
  availability_zone = "us-east-2a"

  tags = {
      "Name" = "web1"
    }
  
}
# Lets create a subnet web2	
resource "aws_subnet" "web2" {	
  vpc_id = aws_vpc.ntiervpc.id	

  cidr_block = "192.168.1.0/24"	
  availability_zone = "us-east-2a"	

  tags = {	
    "Name" = "web2"	
  }	
}