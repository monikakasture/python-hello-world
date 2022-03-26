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

Management master VM
Management  VPC
- VPC: vpc-0a456cfb0dd41261b
- Subnet: subnet-01005b844b3dc722b    
- Availability Zone = us-east-2a
- AMI: ami-008e1e7f1fcbe9b80 


# created Production load Instances 
Pushed Terraform code to GitHub and applied to create  2 instances and a security group

Load VPC 
- VPC id: vpc-0fdf778d69038751e 
- Availability Zone =ca-central-1a 
- Subnet id: subnet-03ddbe0583ca7bd8e 
- AMI: ami-041d49677629acc40

# Automating Ansible communication to aws instance 

Master node 

- useradd nishant
- passwd nishant
- visudo
Add nishant user in it
:/101 enter
Nishant All=(ALL) ALL


https://docs.fedoraproject.org/en-US/epel/
- dnf config-manager --set-enabled powertools
- dnf install epel-release epel-next-release

If it doesn’t work
https://techglimpse.com/failed-metadata-repo-appstream-centos-8/
Follow steps and fix it

Then run both dnf commands

- Yum install ansible -y

- su - nishant
- Git branch nishant
- Git clone Project repo
Do all code here and then push it to git hub
- mkdir ansible
- Cd ansible

- vim setup.yaml
---
- name:
  hosts: masters
  vars:
    ansible_ssh_private_key_file: ~/ec-2_key/Management.pem
  remote_user: ec2-user
  tasks:
  - name: Set authorized key taken from file
    authorized_key:
      user: ec2-user
      state: present
      key: "{{ lookup('file', '/home/nishant/.ssh/id_rsa.pub')
 }}"
- name:
  hosts: workers
  vars:
    ansible_ssh_private_key_file: ~/ec-2_key/Load.pem
  remote_user: ec2-user
  tasks:
  - name: Set authorized key taken from file
    authorized_key:
      user: ec2-user
      state: present
      key: "{{ lookup('file', '/home/nishant/.ssh/id_rsa.pub')
 }}"

:wq

- vim inventory 
[masters]
master ansible_host=3.141.42.169 ansible_user=ec2-user

[workers]
worker1 ansible_host=15.223.113.169 ansible_user=ec2-user
worker2 ansible_host=3.96.137.152 ansible_user=ec2-user

- vim ansible.cfg
[defaults]
inventory = /home/nishant/Project/ansible/inventory
remote_user= ec2-user
host_key_checking= False


_____________________
Now copy the private key from AWS instance to
Current location 
- cd ansible
- mkdir ec-2_key
- cd ec-2_key
- vim Management.pem
- Vim Load.pem 
Paste the key

- chmod 400 Management.pem
- Chmod 400 Load.pem

- ssh-keygen
In home directory create keys

- ssh-keyscan 3.17.184.124 >> ~/.ssh/known_hosts
To get the public key of AWS ec2-instance 


- ansible-playbook setup.yaml 
Run this command to run the playbook and it will store public key of our instance to remote machine. Authorized key file.

Jenkins pipeline
https://www.cidevops.com/2020/07/automate-docker-builds-using-jenkins.html


Log in to Jenkins 
Manage Jenkins
Configure credentials
Add
UserName: Docker user name
Password : Docker Password

ID: docker-hub

On master node 

- docker login --username=kasturenishant
It will prompt for password , provide docker hub password

# In all machines including master and load nodes
- useradd jenkins
- sudo usermod -aG docker jenkins 
to add jenkins user to docker group so it can have access to docker.sock

installed docker and docker pipeline plugin in jenkins UI

AWS
login and create ECR to be put docker images 
create private registry just select private give name and save

create IAM role 
https://www.cidevops.com/2020/05/how-to-setup-elastic-container-registry.html
with container registry full access permission
name it ECRfullaccess

and attach role to master machine and all host machines

from AWSec2 machine> settings>manage roles> attach role


#jenkins pipeline

create webhook on github
create job in jenkins 

name: Dokcerjenkinsjob
pipeline
(okay)

go to pipeline and 
add github repo url


save the job

- Vim Jenkinsfile
change the ECR repo link as per your account 
change the github link

- vim Dockerfile
- vim app.py
- vim requirements.txt
pushed it to github 
https://github.com/akannan1087/myPythonDockerRepo (get code from here)

## Manage Jenkins
global tool settings 
>> Jgit select and save for git option
