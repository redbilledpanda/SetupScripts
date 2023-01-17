set -x
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
