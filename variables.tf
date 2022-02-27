variable "default_tags" {
  default = {

    Environment = "ckpo"
    Owner       = "Monty van Emmerik"
    Project     = "My Project"

  }
  description = "Default Tags for Security Groups"
  type        = map(string)
}