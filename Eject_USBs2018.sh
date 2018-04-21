#!/bin/bash
echo Testing > $HOME/Documents/Eject_USBs2018_Executed
longusbname=$(lsblk -l | grep "MULTIBOOT")
if [ -z "$longusbname" ] 
then exit
fi
#trim line of information to just the 'sda1' part
sdUSB="${longusbname:0:4}"

#next: we start ejecting stuff
udisksctl unmount -b /dev/$sdUSB
sleep 2
udisksctl power-off -b /dev/$sdUSB


