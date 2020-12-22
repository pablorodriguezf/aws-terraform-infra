# Create the Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = merge(
    var.all_tags,
    {
      Name    = format("%s",var.name_igw)
      Service = "internet gateway"
      Description = "Create internet gateway"
    }
   )
}
