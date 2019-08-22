# kubeadm-terraform-cluster
Three node Kubeadm kubernetes cluster provisioned using Terraform and Ansible on AWS

infra is provisioned using terraform and configuration is managed by Ansible
*** This is desgined for lab env not for production use security is very relaxed ***

You will need to provide your own SSH key and AWS creds, please insert the following files ```provider.tf``` and ```variables.tf```

To run clone dir, cd to /terrafrom

run ```terrafrom init```
run ```terraform apply```

Whole cluster setup will take roughly 20 minutes to provison fully.

Once fully provisioned you can ssh to 'kube-master' with your key and sudo to root, you will have fully working cluster.

To delete just run in same dir ```terraform destroy```
