resource "aws_vpc" "cloudwatch" {
  tags = {
  Name= "cloudwatchvpc"
  }
 cidr_block  = "10.0.0.0/16"
}
resource "aws_subnet" "cloudwatch_vpc" {
    vpc_id     = aws_vpc.cloudwatch.id
    cidr_block = "10.0.1.0/24"
     tags = {
       Name = "Main"
  }
  
}
resource "aws_security_group" "cloudwatch_sg" {
    name = "vpc_cloudwatchsecurity"
    vpc_id = aws_vpc.cloudwatch.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
     egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }

}
resource "aws_route_table" "vpc_route" {
    vpc_id = aws_vpc.cloudwatch.id
}
resource "aws_internet_gateway" "vpc_ig" {
    vpc_id = aws_vpc.cloudwatch.id
  
}
resource "aws_route_table_association" "vpc_route" {
    subnet_id      = aws_subnet.cloudwatch_vpc.id
    route_table_id = aws_route_table.vpc_route.id
    gateway_id = aws_internet_gateway.vpc_ig.id
  
}
