resource "aws_key_pair" "test-key"
{
  key_name = "test-key"
  public_key = "ssh-rsa DD_add_public_key_here_DD"
}
