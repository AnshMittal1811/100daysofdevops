data "aws_availability_zones" "all" {}
resource "aws_autoscaling_group" "test-asg" {
  launch_configuration    = "${aws_launch_configuration.asg-config.id}"
  availability_zones      = ["${data.aws_availability_zones.all.names}"]
  target_group_arns       = ["${var.target_group_arn}"]
  health_check_type       = "ELB"
  min_size                = "1"
  max_size                = "2"
  tag {
    key = "Name"
    propagate_at_launch = true
    value = "my-terraform-asg-example"
  }
}
