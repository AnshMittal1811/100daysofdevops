resource "aws_launch_configuration" "asg-config" {
  image_id = "${var.image_id}"
  instance_type = "${var.instance_type}"
  security_groups = ["${aws_security_group.asg-sg.id}"]
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_security_group" "asg-sg" {
  name   = "my-test-sg"
  vpc_id = "${var.vpc_id}"
}

# Ingress Security Port 22
resource "aws_security_group_rule" "http_inbound_access" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.asg-sg.id}"
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

# All OutBound Access
resource "aws_security_group_rule" "all_outbound_access" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.asg-sg.id}"
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
