#!/bin/sh
sleep 1
if [ -d "/isodevice/" ]
then
	gsettings set org.gnome.desktop.background picture-uri file:///home/tamstech/Pictures/usb.png
else
	echo USB_Successfully_Ejected > ~/Desktop/USB_Successfully_Ejected
fi
