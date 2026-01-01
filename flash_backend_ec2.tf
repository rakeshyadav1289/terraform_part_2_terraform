# Flask Backend EC2
resource "aws_instance" "flask" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.flask_sg.id]
  user_data              = file("flask-userdata.sh")

  tags = { Name = "Flask-Backend" }
}