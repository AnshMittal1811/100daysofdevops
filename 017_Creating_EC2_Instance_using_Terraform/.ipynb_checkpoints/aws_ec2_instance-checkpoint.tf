resource "aws_instance" "test_instance" {
  count = "${var.instance_count}"
  ami = "${data.aws_ami.centos.id}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.mytest-key.id}"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id = "${element(var.subnet_mask, count.index )}"
  
  tags {
    Name = "my-test-server.${count.index + 1}"
  }
}
