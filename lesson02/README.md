# Lesson 02

- In scope of this lesson it will be created simple AWS terraform environment for 2 AWS VM machine with Debian.
- On first machine will be installed Apache+PHP on second - MySQL;
- Before creation action will be checked with "plan";
- After creation connection via SSH will be tested;
- After creation machine will be destroyed;

# Code

Check [terraform](https://github.com/mn3m0nic/terraform-exercises/tree/master/lesson02/terraform) dir.

# Agenda


- [X] Terraform init / AWS plugin install / configure creds / Test;
- [X] AWS create t2.micro 1-st instance with Debian;
- [X] AWS create t2.micro 2-nd instance with Debian;
- [X] Install Apache+PHP on VM1 using Terraform
- [X] Install MySQL-server on VM2 using Terraform
- [ ] Create simple PHP code as site engine
- [ ] Create simple MySQL database to import
- [ ] Create connection between VM1 and VM2

# Initialization steps

* Check lesson 01 for details about initialization

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

