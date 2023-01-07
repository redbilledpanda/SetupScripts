set -x
sudo dnf update
sudo dnf install -y openssh-server python3-pip

# start SSH serice
sudo systemctl start sshd.service
sudo systemctl enable sshd.service
