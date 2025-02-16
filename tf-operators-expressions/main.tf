terraform {}

variable "num_list" {
  type    = list(number)
  default = [1, 2, 3, 4, 5]
}

variable "person_list" {
  type = list(object({
    name   = string,
    gender = string,
    age    = number
  }))
  default = [{
    name   = "kavya"
    gender = "male"
    age    = 20
    }, {
    name   = "Hunny"
    gender = "male"
    age    = 20
  }]
}

variable "map_list" {
  type = map(number) # key, value pair
  default = {
    "zero" = 0 # mapping digit to number
    "one"  = 1
  }
}

# calculations
locals {
  mul = 2 * 2
  add = 2 + 2
  eq  = 2 != 3

  #   double the value
  double = [for num in var.num_list : num * 2]
  odd    = [for num in var.num_list : num if num % 2 != 0]

  name = [for person in var.person_list : person.name]

  mapInfo = [for key, value in var.map_list : value * 5]

  double_map = { for k, v in var.map_list : k => v * 2 }
}

output "output" {
  value = local.name

}
output "output2" {
  value = var.num_list

}

output "obj" {
  value = local.double_map
}
