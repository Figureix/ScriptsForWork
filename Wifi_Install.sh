#!/bin/bash
# Installing Broadcome Wifi Driver
echo 
echo "----------Installing----------"
echo 
# libc-dev-bin
sudo dpkg -i '/home/tamstech/Documents/libc-dev-bin.deb'
echo 
echo "----------libc-dev-bin Installed----------"
echo 
sleep 5

# libc6-dev
sudo dpkg -i '/home/tamstech/Documents/libc6-dev.deb'
echo 
echo "----------libc6-dev Installed----------"
echo 
sleep 5

# bcmwl-kernel-source
sudo dpkg -i '/home/tamstech/Documents/bcmwl-kernel-source.deb'
echo 
echo "----------bcmwl-kernel-source Installed----------"
echo 

echo "Wifi has been installed" > /home/tamstech/Desktop/Wifi_Installed

echo 
# Lets have the tech/user acknowledge this scripts completion
printf "All Finished. Press any key to exit..."
tty_state=$(stty -g)
stty -icanon
LC_ALL=C dd bs=1 count=1 >/dev/null 2>&1
stty "$tty_state" 
</dev/tty
