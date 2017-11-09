# Lesson 01

- In scope of this lesson it will be created simple AWS terraform environment for 1 AWS VM machine with Debian.
- Before creation action will be checked with "plan";
- After creation connection via public IP via SSH will be tested;
- After creation machine will be destroyed;

# Code

Check [terraform](https://github.com/mn3m0nic/terraform-exercises/tree/master/lesson01/terraform) dir.

# Tasks

- [X] Terraform init / AWS plugin install / configure creds / Test;
- [X] AWS create 1 VM "t2.micro" instance with Debian 9;
- [X] terraform plan/apply/show
- [X] Save public IP in external local file;
- [X] SSH access test via public IP
- [X] terraform destroy

# Visual

```bash
terraform graph
```

![](https://github.com/mn3m0nic/terraform-exercises/blob/master/lesson01/lesson01.png?raw=true)

# Initialization steps

- Go to [AWS - AMI](https://console.aws.amazon.com/iam/home?#/users/nick?section=security_credentials) and create your new keys for AWS;
- Check that there are no "/" or "+" char in secret key - if there are this chars - Regenerate key again; Related with [bug](https://github.com/hashicorp/terraform/issues/2972);
- Put keys data or in config or in Shell variables like this (.bashrc or .envrc to save them):
- You can skip adding environment variables if you have AWS-CLI configured or if you pass your KEY/SECRET as arguments (not safe);

```bash
export TF_VAR_AWS_ACCESS_KEY="KEYDATA"
export TF_VAR_AWS_SECRET_KEY="SECRETKEYDATA"
```

# Installation with hard core merging repos

* (template + variable-data(lesson) + private-data/keys)

```
#!/bin/bash
## 10-init-all.sh
D=$(date +"%Y%m%d_%H%M%S")
OUTDIR="work${D}"
VL="lesson01"
PRIVATE_DIR="/home/user/dir-with-private-configs"
VARDATA_DIR="/home/user/terraform-exercises/${VL}"
echo "1/4 Cloning Vagrant template AGT..."
svn export https://github.com/mn3m0nic/vagrant-agt/trunk/environment/debian-agt/ ${OUTDIR}
echo "2/4 Merging with PRIVATE data..."
rsync -a --exclude '.git*' ${PRIVATE_DIR}/ ${OUTDIR}/
echo "3/4 Merging with VAR-DATA ${LESSON} data..."
IFS=$'\n'
for dir in $(find ${VARDATA_DIR} -mindepth 1 -maxdepth 1 -type d); do
  echo rsync -a ${dir} ${OUTDIR}
  rsync -a ${dir} ${OUTDIR}
done
echo "Initializing local repo..."
cd work${D}
rm -rf .git
git init
git add .
git commit -m init
echo "4/4 Building environment..."
make init
make start
```

## Testing terraform environment from VM

After everything will be ready to go than login to vagrant machine and test your 
Terraform temaplate for current task:

```
make ssh
cd terraform
terraform init
terraform plan
terraform apply
#(...) Testing
terraform destroy
```

## Destroy everything and VM

```
make kill
```

# Used links:

* [AMI Locator](https://cloud-images.ubuntu.com/locator/ec2/)
* [Terraform documentation](https://www.terraform.io/docs/providers/aws/)
* [AWS console users/keys/permissions](https://console.aws.amazon.com/iam/home?#/home)

