# Launch worker nodes
resource "aws_instance" "k8s_worker" {
  count         = var.worker_instance_count
  ami           = var.ami["worker"]
  instance_type = var.instance_type["worker"]
  tags = {
    Name = "k8s-worker-${count.index}"
  }
  key_name        = aws_key_pair.k8s.key_name
  security_groups = ["k8s_worker_sg"]
  depends_on      = [aws_instance.k8s_master]
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./ssh_key/k8s")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "./k8s_scripts/worker.sh"
    destination = "/home/ubuntu/worker.sh"
  }
  provisioner "file" {
    source      = "./ansible_playbook/worker_join.sh"
    destination = "/home/ubuntu/worker_join.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/worker.sh",
      "sudo sh /home/ubuntu/worker.sh k8s-worker-${count.index}",
      "chmod +x /home/ubuntu/worker_join.sh",
      "sudo sh /home/ubuntu/worker_join.sh"
    ]
  }
}