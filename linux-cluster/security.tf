########### Security ################
# Step 1
resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.webappvpc.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "mysg"
  }
}

# Step 2
resource "aws_key_pair" "mykp" {
  key_name   = "mykp"
  public_key = var.mypublickey
}

