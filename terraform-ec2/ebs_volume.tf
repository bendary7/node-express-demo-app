resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "us-east-1a"
  size              = var.ebs_size
  type              = "gp2"

  tags = {
    Name = "ebs-volume-terraform-demo"
  }
}

resource "aws_volume_attachment" "ebc_volume_attachment" {
  instance_name = var.instance_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.ebs_instance_example.id
}

data "template_file" "init" {
  template = "${file("volume.sh")}"

  vars = {
    instance_name = var.instance_name
  }
}
