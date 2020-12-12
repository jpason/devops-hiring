variable "db_password" {
  type = string
}

resource "aws_db_instance" "devops-hiring-db" {
  allocated_storage    = 15
  engine               = "postgres"
  engine_version       = "10.14"
  identifier           = "devops-hiring-db"
  instance_class       = "db.t3.micro"
  password             = var.db_password
  skip_final_snapshot  = true
  storage_encrypted    = true
  username             = "django"
}
