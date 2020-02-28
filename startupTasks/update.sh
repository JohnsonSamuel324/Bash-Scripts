#!/bin/bash

#Setup variables
User=$(whoami)
logFile=/home/$User/logs.txt

# Logs the date and time into the logs.txt file in home dir.
echo "Updates ran at startup on:" $(date +%B-%d-%Y)-$(date +%I:%M) >> $logFile

# If unable to find logs.txt file it will create one for the user
if [ ! -f "$logFile" ]
then
	echo "Creating log file..."
	touch $logFile
fi

# Runs the update and upgrade checker. Will say yes to all updates then will be logged in the logs.txt file
sudo apt update && sudo apt upgrade -y >> $logFile

# Creates a barrier between this log and the next log
echo "-------------------------------------------------" >> $logFile
# -Suspect
