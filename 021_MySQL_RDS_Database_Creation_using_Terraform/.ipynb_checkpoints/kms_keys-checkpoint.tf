resource "aws_kms_key" "rds-key" {
    description = "key to encrypt rds password"
  tags {
    Name = "my-rds-kms-key"
  }
}

resource "aws_kms_alias" "rds-kms-alias" {
  target_key_id = "${aws_kms_key.rds-key.id}"
  name = "alias/rds-kms-key"
}