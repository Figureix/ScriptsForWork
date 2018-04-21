#!/bin/bash
# Removing Broadcome Wifi Driver
echo 
echo "----------Removing----------"
echo 
# bcmwl-kernel-source
sudo dpkg -r bcmwl-kernel-source

sleep 5

sudo dpkg --purge bcmwl-kernel-source
echo
echo "----------bcmwl-kernel-source Removed----------"
echo 
sleep 5

# libc6-dev
sudo dpkg -r libc6-dev
echo 
echo "----------libc6-dev Removed----------"
echo 

sleep 5

# libc-dev-bin
sudo dpkg -r libc-dev-bin
echo 
echo "----------libc-dev-bin Removied----------"
echo 
echo "Wifi has been uninstalled" > /home/tamstech/Desktop/Wifi_Uninstalled

echo 
# Lets have the tech/user acknowledge this scripts completion
printf "All Finished. Press any key to exit..."
tty_state=$(stty -g)
stty -icanon
LC_ALL=C dd bs=1 count=1 >/dev/null 2>&1
stty "$tty_state" 
</dev/tty


