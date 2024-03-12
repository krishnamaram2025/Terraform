resource "aws_instance" "runner_node" {
  count = var.runner_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.medium"
  tags = {
    Name = "runner"
  }
}

resource "aws_instance" "master_node" {
  count = var.master_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.medium"
  tags = {
    Name = "master-${count.index + 1}"
  }
}

resource "aws_instance" "worker_node" {
  count = var.worker_count
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.medium"
  tags = {
    Name = "worker-${count.index + 1}"
  }
}