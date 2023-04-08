subnetwork_project = "devops-research-337511"
region = "us-central1"

# Instance
hostname = "testing"
machine_type = "n1-standard-1"
network = "devops-research-337511-vpc-network"
subnetwork = "devops-research-337511-staging-subnet"
public_static_ip = "no"
access_config = [
  {
    nat_ip = "false"
    network_tier = "STANDARD"
  }
]
disk_name = "testing-instance-disk"
boot_disk = "test-vm-disk"
boot_disk_size_gb = 10
#source_disk_snapshot = "my-snapshot"
disk_size_gb = 10
disk_type = "pd-ssd"
disk_labels = {
  environment = "test"
}
additional_disk_name = "test-vm-additional-disk"
#source_disk_snapshot_external = ""
regional_disk = "false"
#replica_zones = ["us-central1-a", "us-central1-b", "us-central1-f"]
preemptible = false
#instance_scope = ["cloud-platform"]

#metadata = {
#  ssh-keys = "my-key"
#}


labels = {
  environment = "dev"
  teamname    = ""
  ticket      = ""
}
tags = ["testvm", "cez-india-hq"]
can_ip_forward = false
enable_confidential_vm = false
on_host_maintenance = "MIGRATE"
module_depends_on = []

# Compute disk
#project_id = "my-gcp-project"
#region = "us-central1"
#zone = "us-central1-c"
#disk_name = "my-disk"
#disk_type = "pd-standard"
#disk_size = "10"
#source_image = "debian-9-v20210817"
#source_snapshot = "my-snapshot"
#snapshot_project_id = "my-gcp-project"
#snapshot_name = "my-snapshot"
#snapshot_description = "This is my snapshot."
#snapshot_labels = {
#  environment = "dev"
#}


