resource "aws_route53_record" "simple_records" {
  count = length(var.records)

  zone_id = var.zone_id
  name    = var.records[count.index].name
  type    = var.records[count.index].type
  ttl     = var.records[count.index].ttl
  records = var.records[count.index].value
}
