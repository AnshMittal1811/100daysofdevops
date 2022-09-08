resource "aws_security_group" "alb-sg" {
  name   = "my-alb-sg"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "http_allow" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.alb-sg.id}"
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "all_outbound_access" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.alb-sg.id}"
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
