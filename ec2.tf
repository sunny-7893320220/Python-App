resource "aws_instance" "demo" {
  ami                         = "ami-03972092c42e8c0ca"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "terrFORM"
  vpc_security_group_ids      = ["${aws_security_group.demosg.id}"]
  subnet_id                   = "${aws_subnet.pub-subnet-1.id}"
  associate_public_ip_address = true   
  user_data                   = "${file("userdata.sh")}"

  tags = {
    Name = "demo"
  }
}
