#!/bin/sh
# This script was pulled together by David Carlson (created by reading examples on the inter-webs)
echo 'Ejecting USB automatically...'


exec $HOME/Documents/Eject_USBs2018.sh &


# Eject Optical Drive
eject

echo 
echo '----------Finished----------'
echo

# Pump up the Jam!
echo 'Next setting Volume to MAX'
amixer -D pulse sset Master 100%+ 
echo 
echo '----------Finished----------'
echo  

sleep 3

if [ -d "/isodevice/" ]
    then
	    gsettings set org.gnome.desktop.background picture-uri file:///home/tamstech/Pictures/usb.png
    else
	    echo USB_Successfully_Ejected > ~/Desktop/USB_Successfully_Ejected
fi

# Lets have the tech/user acknowledge this scripts completion
printf "Press any key to exit..."
tty_state=$(stty -g)
stty -icanon
LC_ALL=C dd bs=1 count=1 >/dev/null 2>&1
stty "$tty_state" 
</dev/tty

sleep 1
#Check USB again...
sh Double_Check_USB.sh

# End of Script.
