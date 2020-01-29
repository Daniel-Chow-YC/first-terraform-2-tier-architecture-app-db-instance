variable "vpc_id" {
}

variable "app_sg_id" {
  description = "security group from app"
}

variable "name" {
  description = "name interpolated from original main.tf files"
}

variable "ami_id_mongodb" {

}
