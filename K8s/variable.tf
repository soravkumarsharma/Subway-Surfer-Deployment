variable "region" {
  default = "us-east-1"
}

variable "ami" {
  type = map(string)
  default = {
    master = "ami-06aa3f7caf3a30282"
    worker = "ami-06aa3f7caf3a30282"
  }
}

variable "instance_type" {
  type = map(string)
  default = {
    master = "t2.medium"
    worker = "t2.medium"
  }
}

variable "worker_instance_count" {
  type    = number
  default = 1
}