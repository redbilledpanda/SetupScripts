set -x
sudo apt-get update
sudo apt-get install -y openssh-server python3-pip

# start SSH service
sudo systemctl enable ssh --now
sudo systemctl start ssh

# installing ansible
python3 -m pip install --user ansible
