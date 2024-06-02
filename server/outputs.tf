output "elb_address" {
  value = aws_lb.this.dns_name
}
