#!/bin/bash
#Get some information from the computer, and save to a file
exec sudo dmidecode --type 17 > $HOME/Documents/GetMemoryInfo_Output &
sleep 1
lspci >> $HOME/Documents/GetMemoryInfo_Output
