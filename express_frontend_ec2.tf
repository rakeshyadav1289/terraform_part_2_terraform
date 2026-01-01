# Express Frontend EC2
resource "aws_instance" "express" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.express_sg.id]

  user_data = templatefile("express-userdata.sh", {
    flask_private_ip = aws_instance.flask.private_ip
  })

  tags = { Name = "Express-Frontend" }
}
