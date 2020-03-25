resource "aws_key_pair" "ec2_key" {
  key_name   = "MyKeyPair"
  public_key = "${file(var.pub_key)}"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

resource "aws_instance" "mqtt" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name

  connection {
    private_key = "${file(var.priv_key)}"
    host_key = "${file(var.pub_key)}"
    user        = "ec2-user"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = ["sudo apt-get -qq install python -y"]
  }

  tags = {
    Name     = "MQTT"
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 30;
      >mqtt.ini;
	echo "[message_queues]" | tee -a mqtt.ini;
	echo "${aws_instance.mqtt.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=${var.priv_key}" | tee -a mqtt.ini;
      	export ANSIBLE_HOST_KEY_CHECKING=False;
	ansible-playbook -u ec2-user --private-key ${var.priv_key} -i mqtt.ini ${var.ansible_playbook}/install.yml
    	EOT
  }

}
