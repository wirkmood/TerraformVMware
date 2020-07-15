######################################################
# Variables for Template
######################################################

variable "user_vsphere" {
  type    	= "string"
  default 	= "%USER_VCENTER@SSO.DOMAINE%"
}

variable "vsphere_password" {
  type    	= "string"
  default 	= "%PASSWORD_VCENTER%"
}

variable "vsphere_server" {
 type		= "string"
 default	= "%IP_Vcenter%"
}

variable "vsphere_datacenter" {
 type		= "string"
 default 	= "%DATACENTER_NAME%"
}

variable "vsphere_datastore" {
 type           = "string"
 default 	= "%DATASTORE_NAME%"
}

variable "vsphere_compute_cluster" {
 type 		= "string" 
 default 	= "%CLUSTER_NAME%"
}

variable "vsphere_network" {
 type           = "string"
 default       = "%VSPHERE_NETWORK_NAME%" 

 
 
variable "vsphere_virtual_machine" {
 type           = "string"
 default 		= "%VM_TEMPLATE_NAME%"
}

variable "guest_id" {
 type           = "string"
 default 		= "windows9Server64Guest"
}

# Nom de la VM clonée
variable "host_name" {
 type           = "string"
 default 		= "%VM_NAME%"
}

variable "domain" {
 type           = "string"
 default 		= "%DOMAINE.COM%"
}


variable "ipv4_address" {
 type           = "string"
 default 		= "%IP_VM%"
}

variable "ipv4_netmask" {
 type           = "string"
 default 		= "24"
}


variable "ipv4_gateway" {
 type           = "string"
 default 		= "%IP_GATEWAY"
}

variable "dns_servers" {
  type    = "list"
  default = ["%DNSIP%"]
}

variable "dns_suffix" {
  type    = "list"
  default = ["%DOMAINE.COM%"]
}

variable "domain_admin_user" {
  type    = "string"
  default = "%ADMINISTRATOR@DOMAIN.COM%"
}

variable "domain_admin_password" {
  type    = "string"
  default = "%PASSWORD%"
}

