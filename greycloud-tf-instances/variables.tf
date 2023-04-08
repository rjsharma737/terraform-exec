variable "project" {
  type        = string
  description = "The GCP project ID"
  default     = null
}

variable "hostname" {
  #type        = list(string)
  type         = string
  description = "The hostname of the instance"
}


variable "tags" {
  type        = list(string)
  description = "Network tags, provided as a list"
  default     = [ "testvm","cez-india-hq" ]
}

variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"
  default     = {}
}


variable "machine_type" {
  type        = string
  description = "Machine type of the instance."
  default     = "n1-standard-1"
}

variable "source_image" {
  description = "Source disk image. If neither source_image nor source_image_family is specified, defaults to the latest public debian image."
  default     = "greymatter-vm-image-1-0-0"
}

variable "source_image_family" {
  description = "Source image family. If neither source_image nor source_image_family is specified, defaults to the latest public CentOS image."
  default     = ""
}

variable "source_image_project" {
  description = "Project where the source image comes from. The default project contains CentOS images."
  default     = ""
}

variable "zone" {
  type        = string
  description = "Zone in which to create the instance."
  default     = null
}

variable "region" {
  type        = string
  description = "Region in which to create the instance."
}

variable "boot_disk" {
  type        = string
  description = "Name of the boot disk."
}

variable "boot_disk_size_gb" {
  description = "Boot Disk size in GB"
  default     = "20"
}


variable "disk_size_gb" {
  type        = number
  description = "Size of the additional disk in GB."
  default     = 50
}

variable "disk_type" {
  type        = string
  description = "Type of the additional disk."
}

variable "additional_disks" {
  description = "List of maps of additional disks. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#disk_name"
  type = list(object({
    disk_name    = string
    device_name  = string
    auto_delete  = bool
    boot         = bool
    disk_size_gb = number
    disk_type    = string
    disk_labels  = map(string)
  }))
  default = []
}

variable "disk_name" {
  description = "disk name"
  default     = ""
}

variable "additional_disk_name" {
  type        = string
  description = "Name of the additional disk."
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork in which to create the instance."
}

variable "subnetwork_project" {
  type        = string
  description = "Project ID of the subnetwork."
}

variable "network" {
  type        = string
  description = "Name of the network."
}

variable "access_config" {
  type        = list(any)
  description = "List of access configs for the instance."
  default     = []
}

variable "preemptible" {
  type        = bool
  description = "Whether to create a preemptible instance."
  default     = false
}

variable "enable_confidential_vm" {
  type        = bool
  description = "Whether to enable confidential VMs for the instance."
  default     = false
}

variable "on_host_maintenance" {
  type        = string
  description = "Behavior to apply when the instance experiences maintenance events on the underlying host."
  default     = "MIGRATE"
}

variable "can_ip_forward" {
  type        = bool
  description = "Whether the instance can send and receive packets with non-matching destination or source IPs."
  default     = false
}


variable "gpu" {
  type        = object({
    type  = string
    count = number
  })
  description = "GPU configuration for the instance."
  default     = null
}

variable "module_depends_on" {
  type        = list(any)
  description = "List of resources or modules that this module depends on."
  default     = []
}

variable "regional_disk" {
  type        = bool
  description = "Whether the disk is a regional disk."
  default     = false
}

variable "backup_restore" {
  type        = bool
  description = "Whether to create a backup or restore a disk from a backup."
  default     = false
}

variable "disk_labels" {
  type        = map(string)
  description = "Map of labels to apply to the disk."
}


variable "source_disk_snapshot" {
  description = "static disk snapshot name"
  default     = "projects/greymatter-development/global/snapshots/greymatter-vm-snapshot-1-0-0"
}


variable "source_disk_snapshot_external" {
  description = "static disk snapshot name"
  default     = "projects/greymatter-development/global/snapshots/greymatter-vm-snapshot-1-0-0-external"
}

variable "instance_scope" {
  type        = list(string)
  description = "Instance Scope"
  default     = ["monitoring-write"]
}

variable "public_static_ip" {
  description = "public ip for vm"
  default     = "no"
}

variable "monitoring_vm_enabled" {
  type        = bool
  description = "Create prod related env (Input yes/no)"
  default     = "false"
}

variable "nat_ip" {
  description = "Public ip address"
  default     = null
}

variable "metadata" {
  type        = map(string)
  description = "Metadata, provided as a map"
  default     = {}
}

variable "startup_script" {
  description = "User startup script to run when instances spin up"
  default     = ""
}

variable "disk_encryption_key" {
  description = "The self link of the encryption key that is stored in Google Cloud KMS to use to encrypt all the disks on this instance"
  type        = string
  default     = null
}


variable "gce_ssh_user" {
  description = "username for ssh connection"
  default     = "greyuser"
}

variable "gce_ssh_pub_key_file" {
  description = "public key for ssh connection"
}


