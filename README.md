# Terraform 101

This is my first terraform project.

Terraform is an orchestration tool, which will deploy AMIs into the cloud.

It can use many providers and use different types of images and/or provisioning.

In our stack we have:
- Chef - configuration management
- Packer - creates immutable images of our machines
- Terraform - is the orchestration tool that will setup the infrastructure in the cloud  

# Commands
- terraform init
- terraform plan
- terraform refresh
- terraform apply
- terraform destroy

# 2 Tier Architure Nodejs Sample App and Mongodb fully automated [latest commit]
- Simply run `terraform apply`
- This will create a 2 tier architecture VPC on AWS with an app EC2 instance in a public subnet and a database EC2 instance in a private subnet.  


# 2 tier architecture Nodejs Sample App and Mongodb [old commit]
- If the app is already running kill it first so that when you add the environmental variable and you restart the app, the app can take the environmental variable into account
  - `ps aux | grep node`
  - `sudo kill <process id number>``
- add environmental variable on app instance
  - `export DB_HOST=mongodb://<private ip of mongodb instance>:27017/posts`
- `cd /home/ubuntu/app`
- `sudo npm install mongoose ejs express`
- `npm start`

- `cd seeds`
- `node seed.js`
