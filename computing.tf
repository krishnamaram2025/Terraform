resource "aws_instance" "bastionhost_server" {
  count = var.bastionhost_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.medium"
  tags = {
    Name = "bastionhost_server"
  }
}

resource "aws_instance" "jenkins_server" {
  count = var.jenkins_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.micro"
  tags = {
    Name = "jenkins-server"
  }
}

resource "aws_instance" "artifactory_server" {
  count = var.artifactory_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.medium"
  tags = {
    Name = "artifactory-server"
  }
}

resource "aws_instance" "haproxy_server" {
  count = var.haproxy_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.micro"
  tags = {
    Name = "haproxy_server"
  }
}

resource "aws_instance" "nginx_server" {
  count = var.nginx_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.medium"
  tags = {
    Name = "nginx_server"
  }
}

resource "aws_instance" "gunicorn_server" {
  count = var.gunicorn_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.medium"
  tags = {
    Name = "gunicorn_server"
  }
}

resource "aws_instance" "mysql_count" {
  count = var.mysql_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.medium"
  tags = {
    Name = "mysql-server"
  }
}

 
