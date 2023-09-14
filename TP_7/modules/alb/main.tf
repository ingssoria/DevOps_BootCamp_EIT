resource "aws_security_group" "alb-sg-http" {
  name        = "alb-sg-http"
  description = "ALB Security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"    
    cidr_blocks = [var.my_ip_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      NAME = "alb-sg-http"
      OWNER = "ing.ssoria@gmail.com"
  }   
}

resource "aws_lb_target_group" "apache-alb-target-group" {
  name        = "apache-alb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/healthcheck"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

  tags = {
      NAME = "apache-alb-target-group"
      OWNER = "ing.ssoria@gmail.com"
  }
}

resource "aws_lb_target_group_attachment" "apache-alb-target-group-attachments" {
  count            = length(var.aws_instances)
  target_group_arn = aws_lb_target_group.apache-alb-target-group.arn
  target_id        = var.aws_instances[count.index]
  port             = 80
}


module "alb" {
    source  = "terraform-aws-modules/alb/aws"
    version = "8.7.0"

    name = "tp7-alb"
    
    load_balancer_type = "application"

    vpc_id  = var.vpc_id
    subnets = var.public_subnets
    security_groups = [aws_security_group.alb-sg-http.id]
    
    tags = {
        OWNER = "ing.ssoria@gmail.com"
    }  
}