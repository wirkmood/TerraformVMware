provider "vsphere" {
	user   				 = "${var.user_vsphere}"
	password    		 = "${var.vsphere_password}"
	vsphere_server  	 = "${var.vsphere_server}"
 	allow_unverified_ssl = true
}
