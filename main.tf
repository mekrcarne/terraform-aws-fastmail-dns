resource "aws_route53_record" "mx" {
  zone_id = "${var.route53_zone_id}"
  name    = "${var.domain_name}"
  type    = "MX"
  ttl     = "3600"

  records = [
    "20 in2-smtp.messagingengine.com.",
    "10 in1-smtp.messagingengine.com.",
  ]

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "root_domain_txt" {
  count   = "${var.create_root_domain_txt ? 1 : 0}"
  zone_id = "${var.route53_zone_id}"
  name    = "${var.domain_name}"
  type    = "TXT"
  ttl     = "3600"

  records = [
    "v=spf1 include:spf.messagingengine.com ?all",
  ]
}

resource "aws_route53_record" "adsp_domainkey_txt" {
  zone_id = "${var.route53_zone_id}"
  name    = "_adsp._domainkey"
  type    = "TXT"
  ttl     = "3600"

  records = [
    "dkim=unknown",
  ]
}

resource "aws_route53_record" "wildcard_mx_txt" {
  zone_id = "${var.route53_zone_id}"
  name    = "*.${var.domain_name}"
  type    = "MX"
  ttl     = "3600"

  records = [
    "20 in2-smtp.messagingengine.com.",
    "10 in1-smtp.messagingengine.com.",
  ]
}

resource "aws_route53_record" "client_smtp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_client._smtp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "1 1 1 fastmail.com",
  ]
}

resource "aws_route53_record" "caldav_tcp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_caldav._tcp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "0 0 0 .",
  ]
}

resource "aws_route53_record" "caldavs_tcp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_caldavs._tcp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "0 1 443 caldav.fastmail.com",
  ]
}

resource "aws_route53_record" "carddav_tcp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_carddav._tcp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "0 0 0 .",
  ]
}

resource "aws_route53_record" "carddavs_tcp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_carddavs._tcp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "0 1 443 carddav.fastmail.com",
  ]
}

resource "aws_route53_record" "imap_tcp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_imap._tcp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "0 0 0 .",
  ]
}

resource "aws_route53_record" "imaps_tcp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_imaps._tcp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "0 1 993 imap.fastmail.com",
  ]
}

resource "aws_route53_record" "pop3_tcp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_pop3._tcp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "0 0 0 .",
  ]
}

resource "aws_route53_record" "pop3s_tcp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_pop3s._tcp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "10 1 995 pop.fastmail.com",
  ]
}

resource "aws_route53_record" "submission_tcp_srv" {
  zone_id = "${var.route53_zone_id}"
  name    = "_submission._tcp"
  type    = "SRV"
  ttl     = "3600"

  records = [
    "0 1 587 smtp.fastmail.com",
  ]
}

resource "aws_route53_record" "mail_a" {
  zone_id = "${var.route53_zone_id}"
  name    = "mail"
  type    = "A"
  ttl     = "3600"

  records = [
    "66.111.4.147",
    "66.111.4.148",
  ]
}

resource "aws_route53_record" "mail_mx" {
  zone_id = "${var.route53_zone_id}"
  name    = "mail"
  type    = "MX"
  ttl     = "3600"

  records = [
    "20 in2-smtp.messagingengine.com",
    "10 in1-smtp.messagingengine.com",
  ]
}

resource "aws_route53_record" "fm1_domainkey_cname" {
  zone_id = "${var.route53_zone_id}"
  name    = "fm1._domainkey"
  type    = "CNAME"
  ttl     = "3600"

  records = [
    "fm1.${var.domain_name}.dkim.fmhosted.com",
  ]
}

resource "aws_route53_record" "fm2_domainkey_cname" {
  zone_id = "${var.route53_zone_id}"
  name    = "fm2._domainkey"
  type    = "CNAME"
  ttl     = "3600"

  records = [
    "fm2.${var.domain_name}.dkim.fmhosted.com",
  ]
}

resource "aws_route53_record" "fm3_domainkey_cname" {
  zone_id = "${var.route53_zone_id}"
  name    = "fm3._domainkey"
  type    = "CNAME"
  ttl     = "3600"

  records = [
    "fm3.${var.domain_name}.dkim.fmhosted.com",
  ]
}
