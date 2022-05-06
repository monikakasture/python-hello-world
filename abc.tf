provider "aws" {

  region = "us-east-1"

  access_key = "AKIA2F4KE2PYHL3TXNVE"

  secret_key = "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"

}



resource "aws_vpc" "default" {

  cidr_block = var.vpc_cidr

  enable_dns_hostnames = true


  tags = {

    Name = ""

  }

}


resource "aws_subnet" "public-subnet" {

  vpc_id = aws_vpc.default.id

  cidr_block = var.public_subnet_cidr

  availability_zone = "us-east-1a"


  tags = {

    Name = ""

  }

}


resource "aws_subnet" "private-subnet" {

  vpc_id = aws_vpc.default.id

  cidr_block = var.private_subnet_cidr

  availability_zone = "us-east-1a"


  tags = {

    Name = ""

  }

}


resource "aws_internet_gateway" "gw" {

  vpc_id = aws_vpc.default.id

}


# Define the route table

resource "aws_route_table" "web-public-rt" {

  vpc_id = aws_vpc.default.id


  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.gw.id

  }


  tags = {

    Name = ""

  }

}


resource "aws_route_table_association" "web-public-rt" {

  subnet_id = aws_subnet.public-subnet.id

  route_table_id = aws_route_table.web-public-rt.id

}


resource "aws_security_group" "vpc_sg" {

  name        = "allow_tls"

  description = "Allow TLS inbound traffic"

  vpc_id      = aws_vpc.default.id


  ingress {

    description      = "TLS from VPC"

    
    from_port        = 3306

    to_port          = 3306

    protocol         = "tcp"

    cidr_blocks      = [aws_vpc.default.cidr_block]

  }


  egress {

    from_port        = 0

    to_port          = 0

    protocol         = "-1"

    cidr_blocks      = ["0.0.0.0/0"]

    ipv6_cidr_blocks = ["::/0"]

  }

}

resource "aws_db_instance" "db" {

  allocated_storage    = 10

  engine               = "mysql"

  engine_version       = "8.0.28"

  instance_class       = "db.t3.micro"

  db_name                 = "mydb"

  
  username             = "foo"

  password             = "foobarbaz"

  parameter_group_name = "default.mysql8.0.28"

  skip_final_snapshot  = true

  vpc_security_group_ids= [aws_security_group.vpc_sg.id]

 s3_import {

    source_engine         = "mysql"

    source_engine_version = "8.0.20"

    bucket_name           = "lane-devops-pairing-exercise-bucket"

    ingestion_role        = "arn:aws:iam::699832521712:role/Nishant"

   }

}
