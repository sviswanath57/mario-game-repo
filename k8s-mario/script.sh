#!/bin/bash
# Install Terraform
sudo yum install wget -y
wget -O- https://yum.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://yum.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/yum/sources.list.d/hashicorp.list
sudo yum update && sudo yum install terraform -y

# Install kubectl
sudo yum update
sudo yum install curl -y
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

# Install AWS CLI 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo yum-get install unzip -y
unzip awscliv2.zip
sudo ./aws/install

#Install docker
sudo yum-get install docker.io -y
sudo usermod -aG docker ubuntu
sudo reboot

echo "Installation completed successfully."

