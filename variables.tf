variable "region" {
  description = "VPC Region"
  type        = string
  default     = "eu-west-1"
}

variable "VPC_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = "10.0.0.0/16"

}


variable "vpc_tag" {
  description = "Tag to change VPC name"
  type        = string
  default     = "Project-VPC"
}

variable "VPC_tenancy" {
  description = "Tenancy option for instances launched into VPC"
  type        = string
  default     = "default"
}


variable "Pub-1-tag" {
  description = "Pub-sub-1 name change"
  type        = string
  default     = "Prod-pub-sub1"

}

variable "Pub-2-tag" {
  type        = string
  description = "Pub-sub-2 name change"
  default     = "Prod-pub-sub2"

}


variable "Priv-1-tag" {
  type        = string
  description = "Priv-sub-1 name change"
  default     = "Priv-pub-sub1"

}

variable "Priv-2-tag" {
  type        = string
  description = "Priv-sub-2 name change"
  default     = "Priv-pub-sub2"

}

variable "Prod_pub_sub_1_cidr" {
  description = "pub-sub-1-cidr block"
  type        = string
  default     = "10.0.1.0/24"

}


variable "Prod_pub_sub_2_cidr" {
  description = "pub sub 2 cidr block"
  type        = string
  default     = "10.0.2.0/24"

}

variable "Prod_priv_sub_1_cidr" {
  description = "priv sub 1 cidr block"
  type        = string
  default     = "10.0.3.0/24"

}


variable "Prod_priv_sub_2_cidr" {
  description = "priv sub 2 cidr block"
  type        = string
  default     = "10.0.4.0/24"

}

variable "Prod-pub-route-table-cidr" {
  description = "pub route table cidr block"
  type        = string
  default     = "10.0.3.0/24"
}

variable "Pub-route-table-tag" {
  description = "pub-route-table name change"
  type        = string
  default     = "Prod-pub-route-table"

}

variable "Prod-priv-route-table-cidr" {
  description = "priv route table cidr block"
  type        = string
  default     = "10.0.4.0/24"
}

variable "Priv-route-table-tag" {
  description = "priv-route-table name change"
  type        = string
  default     = "Priv-pub-route-table"

}


variable "IGW-cidr" {
  description = "IGW cidr destination"
  type        = string
  default     = "0.0.0.0/0"

}

variable "IGW" {
  description = "Tag to change IGW name"
  type        = string
  default     = "Prod-IGW"
}


variable "Nat-cidr" {
  description = "Tag to NAT name"
  type        = string
  default     = "0.0.0.0/0"
}

variable "NAT" {
  description = "Tag to change NAT name"
  type        = string
  default     = "Prod-NAT-Gateway"

}

variable "AZ-1" {
  description = "Pub-sub1 for AZ-1"
  type        = string
  default     = "eu-west-1a"
}

variable "AZ-2" {
  description = "Pub-sub2 for AZ-2"
  type        = string
  default     = "eu-west-1b"

}


variable "AZ-3" {
  description = "Priv-sub for AZ-3"
  type        = string
  default     = "eu-west-1c"

}


variable "AZ-4" {
  description = "Priv-sub for AZ-4"
  type        = string
  default     = "eu-west-1a"

}


variable "dns-toggle" {
  description = "true to enable"
  type        = bool
  default     = true
}











