# Private Route Table

resource "aws_default_route_table" "private_route" {
  default_route_table_id = "${aws_vpc.main.default_route_table_id}"
  route {
    nat_gateway_id = "${aws_nat_gateway.test_nat_gw.id}"
    cidr_block = "0.0.0.0/0"
  }

  tags {
    Name = "my-private-route-table"
  }
}
