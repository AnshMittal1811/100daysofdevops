resource "aws_db_subnet_group" "rds-private-subnet" {
  name = "rds-private-subnet-group"
  subnet_ids = ["${var.rds_subnet1}","${var.rds_subnet2}"]
}
