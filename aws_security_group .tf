resource "aws_security_group" "allow_all_http" {
  name        = "allow_all_http"
  description = "Allow all inbound traffic from internet"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_access_bd" {
  name        = "allow_access_bd"
  description = "Allow the access to the database"
  vpc_id      = "${aws_vpc.main.id}"

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    cidr_blocks = ["10.0.1.0/24"]
  }
}
