# awx
* run step0  (only if you need to send the key) 
* run step1 (to build ansible tower)
* run step2 (to create instances in different region




Prerequisites 
1.AWS 
  OS = CentOS7 
  Instance Type: t2.medium  20 G

2. Create snapshot from the instance 
3. Create image from the snapshot (get the ami number from the image) 
4. Get the VPC ID (from aws) 
5. Get your DNS ( that you created on aws) 
6. Hosted Zone ID  - 

7. Create a user call it terraform (download the access key and secret key, we will need it so put somewhere you can access)  
(Attached existing policy --->> administrative accsess
)
8. Create s3 bucket on the region that you want use 
 
 =-=-=-=-=-=-===- =-=-=-=-=-=-===- =-=-=-=-=-=-===- =-=-=-=-=-=-===- =-=-=-=-=-=-===- =-=-=-=-=-=-===-
 
Ssh to instance become root then install 
1.vim
2.wget
3.unzip
4.git 
 
First install PIP 
curl -O https://bootstrap.pypa.io/get-pip.py python get-pip.py --user  
export PATH=~/.local/bin:$PATH source ~/.bash_profile  
 
Install AWS Cli  
pip install awscli 
 
We need to configure AWS Cli 
Run  aws configure  
After you run this command you will be ask  access key and secret key  
Access key - "save it "
Secret key  - "save it"
Region (the region you will be using Example us-west-2, us-east-1) 
Default output (just press enter) 
To check if works 
Run aws describe-instances 

1. 1. Install Terraform
       cd /usr/local/src
       wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_386.zip
       unzip terraform_0.8.5_linux_386.zip
        mv terraform /usr/local/bin/
        export PATH=$PATH:/terraform-path/
        "terraform" run command to check it ! 

 
Install git if it’s not install the run (git clone https://github.com/daudmu21/terrafrom-awx-aws-.git) 
or https://github.com/volodymyr1213/terrafrom-awx-aws-.git
 cd infrastructure  
 ls   then cd awx   
 ls   
 
Edit the Terraform files 

First file is located at step0_create_key 
Provider.tf 
provider "aws" { 
  region     = "us-west-2"   
  access_key = "${var.AWS_ACCESS_KEY_ID}" 
  secret_key = "${var.AWS_SECRET_ACCESS_KEY}" 
}
=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=
Awx.tfvars  
Key_name (your key from aws) 
Ami (the image that you create from snapshot) 
Vpc_id  
Ssh_key_location (“/ssh_keys/your key”) 
Zone_id (your hosted zone id) 
Domain (your domain) 
Save  
Run terraform init 
terraform fmt 
terraform validate 
Run terraform apply -var-file=awx.tfvars
