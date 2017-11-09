# Lesson 01

- In scope of this lesson it will be created simple AWS terraform environment for 2 AWS VM machine with Debian.
- On first machine will be installed Apache+PHP on second - MySQL;
- Before creation action will be checked with "plan";
- After creation machine will be destroyed;

# Code

Check [terraform](https://github.com/mn3m0nic/terraform-exercises/tree/master/lesson02/terraform) dir.

# Agenda


- [ ] Terraform init / AWS plugin install / configure creds / Test;
- [ ] AWS create t2.micro 1-st instance with Debian;
- [ ] AWS create t2.micro 2-nd instance with Debian;
- [ ] Test "terraform plan",  "terraform apply", "terraform destroy"

# Initialization steps

- Go to [AWS - AMI](https://console.aws.amazon.com/iam/home?#/users/nick?section=security_credentials) and create your new keys for AWS;
- Check that there are no "/" or "+" char in secret key - if there are this chars - Regenerate key again; Related with [bug](https://github.com/hashicorp/terraform/issues/2972);
- Put keys data or in config or in Shell variables like this (.bashrc or .envrc to save them):

```bash
export TF_VAR_AWS_ACCESS_KEY="KEYDATA"
export TF_VAR_AWS_SECRET_KEY="SECRETKEYDATA"
```
- You can skip adding this variables if you have AWS-CLI configured (!)

# Testing

After everything will be ready to go than login to vagrant machine and test your 
Terraform temaplate for current task:

```
make ssh
cd terraform
terraform init
terraform plan
terraform apply
terraform destroy
```

## Destroy VM

```
make kill
```

# Used links:

* [AMI Locator](https://cloud-images.ubuntu.com/locator/ec2/)
* [Terraform documentation](https://www.terraform.io/docs/providers/aws/)
* [AWS console users/keys/permissions](https://console.aws.amazon.com/iam/home?#/home)

