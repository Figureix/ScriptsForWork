#!/bin/bash
#Program to collect Serial Numbers from iPad/iPhone deices
#	Only works when device in booted to recovery mode

# Set up our save/log file
echo -e "\n\nStarting: $(date)\n" >> SerialsCollected.txt

# Pipe syslog into the while loop where we will read each new line that gets added -- checking for serial number
tail -f /var/log/syslog | {
	clear
	echo -e "=======iPad/iPhone Serial Collection Script=======\n  Results will be saved to SerialsCollected.txt    \n        When finished: Ctrl + C to stop.      \n To Capture: Plug in Device while in Recovery Mode\n                 ____by DC____\n\n"
	
	while read -r capture 
			# capture is the variable that will receive the new line of text from 'tail[...]syslog'
		do
			# Next, we will extract the serial number from the returned line
			# Then, I will then cut off the brackets surrounding the serial number and save that into var
			# What is happening: 1st Send capture to grep. 2nd Remove SRNM: and keep serial number. 3rd Remove brackets surrounding serial number
			var=$(grep --line-buffered "SRNM:" <<< "$capture" | grep -oP '(?<=SRNM:)\[(.*)\]' | cut -d "[" -f2 | cut -d "]" -f1)
			
			# After obtaining a match, we will then check if we have a serial number, if we do, we will ask the user for a PT number
			# If var is set, then ask for PT Number
			if [ ! -z "$var" ]
			then
				# We have to direct the read command to receive input from the current terminal /else it breaks
				echo
				read  -p "Please enter the PT Matching [$var]: " var2 </dev/tty

				# With the PT number, we will save the PT + Serial number to a text file
				echo -e "$var2 \t $var" >> SerialsCollected.txt
				echo -e "PT and Serial have been written to file\n"
			fi
	done
	}

# Script crafted by David Carlson -- basic googling and some stackoverflow//debugging was used to make this work.

