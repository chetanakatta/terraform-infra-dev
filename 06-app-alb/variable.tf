variable "project_name" {
    default = "expense"
}
variable "environment" {
    default = "dev"
}
variable "common_tags" {  #tags are usefull for billing of individual components
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
        Component = "app_alb"
    }
}

variable "zone_name" {
    default = "expense.fun"
}