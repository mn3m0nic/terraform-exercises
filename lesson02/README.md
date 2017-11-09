# Lesson 02

- In scope of this lesson it will be created simple AWS terraform environment for 2 AWS VM machine with Debian.
- On first machine will be installed Apache+PHP on second - MySQL;
- Before creation action will be checked with "plan";
- After creation connection via SSH will be tested;
- After creation machine will be destroyed;

# Code

Check [terraform](https://github.com/mn3m0nic/terraform-exercises/tree/master/lesson02/terraform) dir.

# Agenda /TODO
- [X] Terraform init / AWS plugin install / configure creds / Test;
- [X] AWS create t2.micro 1-st instance with Debian;
- [X] AWS create t2.micro 2-nd instance with Debian;
- [X] Install Apache+PHP on VM1 using Terraform
- [X] Install MySQL-server on VM2 using Terraform
- [X] Create simple PHP code as site engine
- [X] Create simple MySQL database to import
- [X] Create connection between VM1 and VM2
All done.

# Map
![](https://github.com/mn3m0nic/terraform-exercises/blob/master/lesson02/docs/map.png?raw=true)

# Testing

```bash
terraform apply
#(...)
```


### Testing with CURL
```bash
curl 123.123.123.123
<!doctype html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Hello world from Terraform+AWS+PHP+MySQL</title>
        <style> td, th { border: 1px solid #ddd;    padding: 8px; } </style>
</head>
<body>
<table><tbody><tr><td>1</td><td>first</td></tr><tr><td>2</td><td>second</td></tr><tr><td>3</td><td>third</td></tr></tbody></pre>
</body>
</html>
```
### Testing via browser

![](https://github.com/mn3m0nic/terraform-exercises/blob/master/lesson02/docs/test.png?raw=true)

## Cleanup

Destroy env and VM:

```
terraform destroy
^D
make kill
```

# Used links:

* [PHP7 manual](https://secure.php.net/manual/en/migration70.new-features.php)
* [PDO manual](https://secure.php.net/manual/en/book.pdo.php)
* [MySQL SELECT command](https://dev.mysql.com/doc/refman/5.7/en/select.html)
* [Terraform documentation](https://www.terraform.io/docs/providers/aws/)
