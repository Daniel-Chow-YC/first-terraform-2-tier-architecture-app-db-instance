resource "aws_security_group" "db_sg" {
  name        = "${var.name} - mongodb"
  description = "Allow port 27017"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    security_groups = [var.app_sg_id]
  }

  ingress {
   from_port   = 3000
   to_port     = 3000
   protocol    = "tcp"
   security_groups = [var.app_sg_id]
 }

 ingress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  security_groups = [var.app_sg_id]
}

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  }


# create a private subnet
resource "aws_subnet" "vpc_private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  tags = {
   Name = "${var.name} - private subnet"
  }
}


# Launch an instance
resource "aws_instance" "db_instance" {
  ami                         = var.ami_id_mongodb
  subnet_id                   = aws_subnet.vpc_private_subnet.id
  vpc_security_group_ids      = [aws_security_group.db_sg.id]
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = "${var.name} - instance of db"
  }
}
