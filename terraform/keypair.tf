resource "aws_key_pair" "cloudops" {
  key_name   = "cloudops-ai-key"
  public_key = file("${path.module}/../keys/cloudops-ai-key.pub")
}
