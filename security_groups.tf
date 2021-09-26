resource "aws_security_group" "elb_security_group" {
  name        = "elb_security_group"
  description = "Allow traffic from outside the web."
  vpc_id      = data.aws_vpc.selected.id

  tags = {
    Name = "elb_security_group"
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = "ec2_security_group"
  description = "Allow traffic only from auto scaling group"
  vpc_id      = data.aws_vpc.selected.id
  tags = {
    Name = "asg_security_group"
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }
}


