#Create kube-worker1 node
resource "aws_instance" "kube-worker1" {
  ami                    = "${var.aws_ami}"
  instance_type          = "t2.medium"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.kube-sg.id}"]
  subnet_id              = "${aws_subnet.subnet.id}"
  associate_public_ip_address = "true"
  ebs_block_device {
    device_name = "/dev/sda1"
    delete_on_termination = true
  }
  tags = {
    Name = "kube-worker1"
  }

  provisioner "remote-exec" {
    inline = ["echo Ready"]

    connection {
      host = "${aws_instance.kube-worker1.public_ip}"
      type = "ssh"
      user = "centos"
      private_key = "${file("~/.ssh/TF.pem")}"
    }
  }

  provisioner "local-exec" {
      command = "sleep 30; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos --private-key ~/.ssh/TF.pem -i '${aws_instance.kube-worker1.public_ip},' ansible/setupmain.yml"
    }
  provisioner "local-exec" {
      command = "sleep 500; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos --private-key ~/.ssh/TF.pem -i '${aws_instance.kube-worker1.public_ip},' ansible/setupworker.yml"
    }
}


#Create kube-worker2 node

resource "aws_instance" "kube-worker2" {
  ami                    = "${var.aws_ami}"
  instance_type          = "t2.medium"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.kube-sg.id}"]
  subnet_id              = "${aws_subnet.subnet.id}"
  associate_public_ip_address = "true"
    ebs_block_device {
     device_name = "/dev/sda1"
     delete_on_termination = true
  }
  tags = {
   Name = "kube-worker2"
   }

  provisioner "remote-exec" {
    inline = ["echo Ready"]

    connection {
      host = "${aws_instance.kube-worker2.public_ip}"
      type = "ssh"
      user = "centos"
      private_key = "${file("~/.ssh/TF.pem")}"
    }
  } 


  provisioner "local-exec" {
      command = "sleep 30; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos --private-key ~/.ssh/TF.pem -i '${aws_instance.kube-worker2.public_ip},' ansible/setupmain.yml"
    }
  provisioner "local-exec" {
      command = "sleep 500; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos --private-key ~/.ssh/TF.pem -i '${aws_instance.kube-worker2.public_ip},' ansible/setupworker.yml"
    }
}