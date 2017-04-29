# terraform-fastmail-on-aws

This is an unofficial [Terraform](https://www.terraform.io) module which creates
[AWS Route 53](https://aws.amazon.com/route53/) records to setup a domain with
[FastMail](https://www.fastmail.com).

## Example Usage

In your Terraform file:

```
resource "aws_route53_zone" "example" {
  name = "example.com"
}

module "example_fastmail" {
  source = "github.com/bluk/terraform-fastmail-on-aws"

  aws_region = "${var.aws_region}"
  domain_name = "example.com"
  route53_zone_id = "${aws_route53_zone.example.zone_id}"
}
```
