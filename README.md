# TerraformVMware

This repository is a sample how user terraform in a VMware environment. 

How to deploy a virtual machine with Terraform and set it with a custom parameters. This can be very useful saving time in production environment.

Pre requirement :
1) vCenter Appliance (using with 1 ESXi).
   --> 1 DATACENTER 
   --> 1 DATASTORE
   --> 1 CLUSTER
   --> 1 vsphere virtual network name 
2) Lastest terraform version (Using Windows or Linux CLI see : https://www.terraform.io/downloads.html)
3) a cloned Virtual Machine within VMware tools installed.
4) If you use a Linux environment you have to install terraform.

1) Open CLI command (DOS or Bash).
2) Go to terraform folder and terraform.exe.
3) "terraform init" to initialize terraform.
4) Go to Windows or Linux folder.
5) Set appropriate variables on "variable.tf" and "main.tf" files.
6) Check your deployement using "terraform plan" command.
7) Deploy your VM using "terraform apply" command.
8) You are able to destroy your ressource using "terraform destroy".


