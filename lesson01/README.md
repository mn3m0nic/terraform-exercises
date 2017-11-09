# Lesson 01

- In scope of this lesson it will be created simple AWS terraform environment for 1 AWS VM machine with Debian.
- Before creation action will be checked with "plan";
- After creation machine will be destroyed;

# Code

Check [terraform](https://github.com/mn3m0nic/terraform-exercises/tree/master/lesson01/terraform) dir.

# Agenda


- [X] Terraform init / AWS plugin install / configure creds / Test;
- [X] AWS create t2.micro instance with Debian;
- [X] Test "terraform plan",  "terraform apply", "terraform destroy"

# Initialization steps

- Go to [AWS - AMI](https://console.aws.amazon.com/iam/home?#/users/nick?section=security_credentials) and create your new keys for AWS;
- Check that there are no "/" or "+" char in secret key - if there are this chars - Regenerate key again; Related with [bug](https://github.com/hashicorp/terraform/issues/2972);
- Put keys data or in config or in Shell variables like this (.bashrc or .envrc to save them):

```bash
export TF_VAR_AWS_ACCESS_KEY="KEYDATA"
export TF_VAR_AWS_SECRET_KEY="SECRETKEYDATA"
```
- You can skip adding this variables if you have AWS-CLI configured (!)

# Installation with hard core merging repos

* (template + variable-data(lesson) + private-data/keys)

```
D=$(date +"%Y%m%d_%H%M%S")
OUTDIR="work${D}"
VL="lesson01"
PRIVATE_DIR="/home/user/dir-with-private-configs"
VARDATA_DIR="/home/user/terraform-exercises/${VL}"
echo "1/4 Cloning Vagrant template AGT..."
git clone https://github.com/mn3m0nic/vagrant-agt ${OUTDIR}
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

