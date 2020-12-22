resource "aws_eip" "eip" {
  vpc   = true
  tags = merge(
    var.all_tags,
    {
      Name    = format("%s", var.name_eip)
      Service = "elastic ip"
      Description = "Create elastic IPs"
    }
   )
}
