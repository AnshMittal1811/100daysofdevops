resource "aws_ebs_volume" "my-test-ebs" {
  count             = 2
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  size              = 10
  type              = "gp2"
}

resource "aws_volume_attachment" "my-test-ebs-attachment" {
  count       = 2
  device_name = "/dev/xvdh"
  instance_id = "${aws_instance.test_instance.*.id[count.index]}"
  volume_id   = "${aws_ebs_volume.my-test-ebs.*.id[count.index]}"
}
