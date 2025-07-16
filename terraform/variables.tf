variable "region" {
  default = "us-east-1"
}
variable "instance_type" {
  default = "t2.micro"
  
}
variable "ami" {
  default = "ami-0a7d80731ae1b2435" # Ubuntu 22.04
  
}
variable "key_name" {
  description = "Name of the key pair to use for the instance"
  type        = string
  default     = "monitoring-key"
}
variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
  default     = "~/.ssh/monitoring-key.pub"
}
