variable "aws_instance_type" {
  description = "instance type for ec2"
  type = string
  # default = "t2.micro"

  # for making limitations
  validation {
    condition = var.aws_instance_type=="t2.micro" || var.aws_instance_type=="t3.micro"
    error_message = "only t2 and t3 micro allowed"
  }
}

# for making env variable => *export TF_VAR_aws_instance_type=t2.micro* || use $env: insted of export in windows
# now no need to set default

# variable "root_volume_size" {
#   description = "valume size of ec2 instance"
#   type = number
#   default = 30
# }
# variable "root_volume_type" {
#   description = "valume type of ec2 instance"
#   type = string
#   default = "gp2"
# }


# to combine same type of variables as above
variable "ec2_config" {
  type = object({
    v_size = number
    v_type = string
  })
  default = {
    v_size = 20
    v_type = "gp2"
  }
}

variable "additional_tags" {
  type = map(string) # key=value format
  default = {
     
  }
}