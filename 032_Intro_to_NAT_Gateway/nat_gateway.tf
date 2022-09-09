#Adding Elastic IP for NAT gateway

resource "aws_eip" "test_eip" {
  vpc = true
}

#Adding NAT Gateway

resource "aws_nat_gateway" "test_nat_gw" {
  allocation_id = "${aws_eip.test_eip.id}"
  subnet_id     = "${aws_subnet.public_subnet.0.id}"
}
