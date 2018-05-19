variable "domain_name" {
  description = "The domain name to setup DNS records for like `example.com`"
}

variable "route53_zone_id" {
  description = "The Route53 resource Hosted Zone ID to create DNS records in. Should be value of aws_route53_zone.<resource name>.zone_id."
}

variable "create_root_domain_txt" {
  description = "Determines if the root domain should have a TXT record. true/false"
  default     = true
}
