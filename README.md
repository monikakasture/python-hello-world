# Project
Infrastructure for Project

Installed git 

 Created project Repo on GitHub
https://github.com/kasturenishant/Project.git
# please clone it in your local machine

Clone it to local machine

Created Project/ Infrastructure-Provisioning/

Installed Terraform from 
https://learn.hashicorp.com/tutorials/terraform/install-cli

Installed AWS CLI
# for Authentication by credential (to make it secure so we don’t have to put credentials in .tf file as plain text

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Created IAM users 
https://us-east-1.console.aws.amazon.com/iam/home#/users$new?step=final&accessKey&userNames=Nishant&userNames=Dhaval&userNames=Faisal&userNames=Gagan&permissionType=policies&policies=arn:aws:iam::aws:policy%2FAdministratorAccess

________________________________________________________________

- [ ] aws configure --profile NK-AWS
#Give  give credentials given to you access id and  key 

- Created code for terraform
- vim main.tf
- vim variable.tf
- vim sg.tf
- [ ] Pushed it to gitHub
- [ ] Terraform init
- [ ] Terraform plan
- [ ] Terraform apply
It will create a security group and ec-2 instance
