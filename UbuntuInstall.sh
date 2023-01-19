set -x
# disable unattended upgrades
sudo apt remove unattended-upgrades

sudo apt-get update
sudo apt-get install -y openssh-server python3-pip

# start SSH service
sudo systemctl enable ssh --now
sudo systemctl start ssh

# installing ansible
python3 -m pip install --user ansible

# installing meld
sudo apt install -y meld

# copy local gitconfig to system wide gitconfig
cp gitconfig ~/.gitconfig

# install github cli
cd /tmp
wget https://github.com/cli/cli/releases/download/v2.21.2/gh_2.21.2_linux_amd64.deb
sudo dpkg -i gh_2.21.2_linux_amd64.deb
