#!/bin/bash
echo "Remote Desktop Setup..."
read -p "Please type the domain (): " DOMAIN
read -p "Please type the target address (ex ): " ADDR
read -p "Type your User Name: " USER
echo
echo "Next, set the window size (ex 1024x680, 1280x720, or 1920x1080)"
read -p "Enter a screen Width: " WIDTH
read -p "Enter a screen Height: " HEIGHT

echo "Attempting Remote Desktop..."
sleep 2

xfreerdp --plugin cliprdr -g $WIDTH\x$HEIGHT -u $USER -d $DOMAIN $ADDR

# Made some edits before pushing to GitHub (omitted some text)
