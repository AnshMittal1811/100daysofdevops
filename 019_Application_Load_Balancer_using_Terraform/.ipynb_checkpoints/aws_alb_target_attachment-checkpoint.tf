resource "aws_lb_target_group_attachment" "my-tg-attachment1" {
  target_group_arn = "${aws_lb_target_group.my-alb-tg.arn}"
  target_id        = "${var.instance_id1}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "my-tg-attachment2" {
  target_group_arn = "${aws_lb_target_group.my-alb-tg.arn}"
  target_id        = "${var.instance_id2}"
  port             = 80
}
