resource "aws_lb" "my-test-lb" {
  name               = "my-test-lb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  subnets            = ["${var.subnet_id1}", "${var.subnet_id2}"]

  enable_deletion_protection = true

  tags {
    Name = "my-test-alb"
  }
}
