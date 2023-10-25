sudo qemu-system-x86_64 -m 512M -kernel ./bzImage -drive format=raw,file=./rootfs.ext4 -serial stdio -append "root=/dev/sda rw console=ttyS0,115200 nokaslr ip=dhcp"
