# kubeadm-terraform-cluster
Kubeadm kubernetes cluster provisioned using Terraform and Ansible

infra is provision using terraform and configuration is managed by Ansible
*** This is desgined for lab env not for production use security is very relaxed ***

You will need to provide your own SSH keys and AWS creds, please insert the following files ```provider.tf``` and ```variables.tf```

To run clone dir, cd to /terrafrom

run ```terrafrom init```
run ```terraform apply```

Whole setup will take roughly ' ' to provison fully.
