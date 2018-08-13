#!/bin/bash
#Get some information from the computer, and save to a file
exec sudo dmidecode --type 17 > $HOME/Documents/GetMemoryInfo_Output &
sleep 1
lspci >> $HOME/Documents/GetMemoryInfo_Output

egrep 'Locator:|Size:' $HOME/Documents/GetMemoryInfo_Output | paste - - - >> $HOME/Documents/GetMemoryInfo_OutputSticks
sed -i $'s/\tBank.*//; s/\tLocator: //; s/Size: //' $HOME/Documents/GetMemoryInfo_OutputSticks $HOME/Documents/GetMemoryInfo_OutputSticks
sync
