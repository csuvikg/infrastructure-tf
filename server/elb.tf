resource "aws_lb" "this" {
  name               = "server-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = [var.elb_subnet_id]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "this" {
  name     = "server-tg"
  port     = var.app_port
  protocol = var.app_port_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.external_port
  protocol          = var.external_port_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = aws_instance.this.id
  port             = var.app_port
}
