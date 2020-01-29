variable "vpc_id" {
  description = "the vpc id of which the app is launched"
}

variable "name" {
  description = "name interpolated from original main.tf files"
}

variable "gateway_id" {
  description = "gateway_id interpolated from original main.tf"
}

variable "ami_id" {
}
