variable "myamiid"{
type = "string"
default = "ami-0affd4508a5d2481b"
}
variable "mykeypair"{
type = "string"
default = "virginia"
}
variable "publicsubnet1"{
type = string
}
variable "privatesubnet1"{
type = string
}
variable "websg"{
type = "string"
}
#variable "lbuserdata"{
#type = "string"
#}
#variable "appuserdata"{
#type = "string"
#}
variable "user_data"{
type = "map"
}
variable "tags"{
type = "map"
}
