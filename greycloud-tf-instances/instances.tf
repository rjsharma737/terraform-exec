##########################################################################
module "compute-instance" {
  source = "git@bitbucket.org:gorcode/terraform-module.git//instances/compute-instance"
  hostname = var.hostname
  machine_type = var.machine_type
  zone = var.zone
  region = var.region
  disk_name = var.boot_disk
  disk_size_gb = var.disk_size_gb
  disk_type = var.disk_type
  additional_disk_name = var.additional_disk_name
  subnetwork = var.subnetwork
  subnetwork_project = var.subnetwork_project
  network = var.network
  access_config = var.access_config
  preemptible = var.preemptible
  enable_confidential_vm = var.enable_confidential_vm
  on_host_maintenance = var.on_host_maintenance
  can_ip_forward = var.can_ip_forward
  metadata = var.metadata
  gpu = var.gpu
  module_depends_on = var.module_depends_on
  regional_disk = var.regional_disk
  backup_restore = var.backup_restore
  disk_labels = var.disk_labels
}

module "instance-template" {
  source = "git@bitbucket.org:gorcode/terraform-module.git//instances/instance-template"
  boot_disk = var.boot_disk
  machine_type = var.machine_type
  zone = var.zone
  region = var.region
  disk_size_gb = var.disk_size_gb
  disk_type = var.disk_type
  subnetwork = var.subnetwork
  subnetwork_project = var.subnetwork_project
  network = var.network
  access_config = var.access_config
  preemptible = var.preemptible
  enable_confidential_vm = var.enable_confidential_vm
  on_host_maintenance = var.on_host_maintenance
  can_ip_forward = var.can_ip_forward
  #metadata = var.metadata

  metadata                 = {
                            ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
                            startup-script = <<-EOF
                            curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
                            sudo bash add-google-cloud-ops-agent-repo.sh --also-install
                            sudo cat <<EOF > /etc/logrotate.d/google-cloud-ops-agent
                            /var/log/google-cloud-ops-agent/subagents/logging-module.log 
                            {
                                rotate 14
                                daily
                                missingok
                                dateext
                                copytruncate
                                notifempty
                                compress
                            }
                            EOF
                            }


  gpu = var.gpu
  #module_depends_on = var.module_depends_on
  disk_labels = var.disk_labels
  source_disk_snapshot = var.source_disk_snapshot
}

module "compute-disk" {
  source = "git@bitbucket.org:gorcode/terraform-module.git//instances/compute-disk"
  boot_disk = var.boot_disk
  disk_type = var.disk_type
  boot_disk_size_gb = var.boot_disk_size_gb
  zone = var.zone
  source_disk_snapshot = var.source_disk_snapshot
  disk_size_gb = var.disk_size_gb
  regional_disk = var.regional_disk
  region = var.region
  source_disk_snapshot_external = var.source_disk_snapshot_external
}



/*
module "instances" {
  source = "git@bitbucket.org:gorcode/terraform-module.git//instances"

  project                 = var.project
  region                  = var.region
  num_instances           = var.num_instances
  instance_name           = var.instance_name
  machine_type            = var.machine_type
  vpc_name                = var.vpc_name
  subnet_name             = var.subnet_name
  ssh_username            = var.ssh_username
  ssh_public_key          = var.ssh_public_key
  boot_disk_size          = var.boot_disk_size
  boot_disk_type          = var.boot_disk_type
  environment             = var.environment
  user_name               = var.user_name
  team_name               = var.team_name
  image_name              = var.image_name


  metadata                 = {
                            ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
                            startup-script = <<-EOF
                            curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
                            sudo bash add-google-cloud-ops-agent-repo.sh --also-install
                            sudo cat <<EOF > /etc/logrotate.d/google-cloud-ops-agent
                            /var/log/google-cloud-ops-agent/subagents/logging-module.log
                            {
                                rotate 14
                                daily
                                missingok
                                dateext
                                copytruncate
                                notifempty
                                compress
                            }
                            EOF
                            }


}
*/
