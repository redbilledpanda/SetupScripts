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
python3 -m pip install --user ansible
echo "export PATH=~/.local/bin:$PATH" >> bashrc
cp bashrc ~/.bashrc

# installing meld
sudo apt install -y meld

# copy local gitconfig to system wide gitconfig
cp gitconfig ~/.gitconfig

# install github cli
cd /tmp
if compgen -G "gh*.deb" > /dev/null; then
   echo "gh installer exists"
else
   wget https://github.com/cli/cli/releases/download/v2.21.2/gh_2.21.2_linux_amd64.deb
   sudo dpkg -i gh_2.21.2_linux_amd64.deb
   sudo update-locale LANG=en_US.utf8
fi

# Kernel Compilation requirements
sudo apt install -y fakeroot build-essential tar ncurses-dev tar xz-utils libssl-dev bc stress python3-distutils libelf-dev linux-headers-$(uname -r) bison flex libncurses5-dev util-linux net-tools linux-tools-generic exuberant-ctags cscope sysfsutils perf-tools-unstable gnuplot rt-tests indent tree smem libnuma-dev numactl hwloc bpfcc-tools sparse flawfinder cppcheck tuna trace-cmd virt-what
