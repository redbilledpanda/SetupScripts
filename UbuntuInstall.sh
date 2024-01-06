set -x
# never prompt me for passwd when I `sudo`
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/dont-prompt-$USER-for-sudo-password"

# copy vimrc
cp vimrc ~/.vimrc

# disable unattended upgrades
sudo apt remove -y unattended-upgrades

#sudo apt-get update
sudo apt --fix-missing update
sudo apt-get install -y vim-gtk3 openssh-server python3-pip
sudo update-alternatives --set editor /usr/bin/vim.basic

# start SSH service
sudo systemctl enable ssh --now
sudo systemctl start ssh

# change default run level to CLI
sudo systemctl enable multi-user.target
#sudo systemctl set-default multi-user.target


# installing ansible
# python3 -m pip install --user ansible
# echo "export PATH=\"~/.local/bin:$PATH\"" >> bashrc
# cp bashrc ~/.bashrc

# installing meld
sudo apt install -y meld

# copy local gitconfig to system wide gitconfig
cp gitconfig ~/.gitconfig

# update locale
sudo update-locale LANG=en_US.utf8

# Kernel Compilation requirements
# sudo apt install -y fakeroot build-essential tar ncurses-dev tar xz-utils libssl-dev bc stress python3-distutils libelf-dev linux-headers-$(uname -r) bison flex libncurses5-dev util-linux net-tools linux-tools-generic exuberant-ctags cscope sysfsutils perf-tools-unstable gnuplot rt-tests indent tree smem libnuma-dev numactl hwloc bpfcc-tools sparse flawfinder cppcheck tuna trace-cmd virt-what

# Jekyll related
# echo "alias testsiteLocally='bundle exec jekyll serve'" >> ~/.bashrc

# Uninstalling prev docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$UBUNTU_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install latest docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# non-root usage
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# post install steps for clean start
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

# Verify install
docker run hello-world
