resource "aws_vpc" "test_vpc" {
  cidr_block = "20.0.0.0/16"

tags = {
    Name = "test_vpc"
  }
}

resource "aws_subnet" "public_test_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "20.0.0.0/24"
    availability_zone = "us-east-1a"        
}

resource "aws_subnet" "private_test_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = "20.0.1.0/24"
  availability_zone = "us-east-1a"
}