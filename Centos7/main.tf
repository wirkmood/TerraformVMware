########
# Template deployment with terraform
#######

data "vsphere_datacenter" "dc" {
  name 				= "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name	          	= "${var.vsphere_datastore}"
  datacenter_id 	= "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          	= "${var.vsphere_compute_cluster}"
  datacenter_id 	= "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          	= "${var.vsphere_network}"
  datacenter_id 	= "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          	= "${var.vsphere_virtual_machine}"
  datacenter_id 	= "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name              = "${var.host_name}"
  resource_pool_id  = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id      = "${data.vsphere_datastore.datastore.id}"
  num_cpus 			= 1
  memory   			= 2048
  guest_id 			= "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type 		= "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   	= "${data.vsphere_network.network.id}"
    adapter_type 	= "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid 	 = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name 	 = "${var.host_name}"
        domain    	 = "${var.domain}"
	  }

    network_interface {
        ipv4_address = "${var.ipv4_address}"
        ipv4_netmask = "${var.ipv4_netmask}"
    }
	  
      ipv4_gateway 	 = "${var.ipv4_gateway}"
	  dns_server_list = "${var.dns_servers}"
      dns_suffix_list = "${var.dns_suffix}"
    }
  }
}
