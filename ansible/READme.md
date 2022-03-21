created the docker-on-all.yml 
it installs docker on all three nodes master and 2 nodes 
it also create jenkins container on master ndoe and run it 

var/run/docker.sock #its permission has to be changed in order to create containers on all nodes as ec2-user

run the plyabook 
ansible-playbook docker-on-all.yml
