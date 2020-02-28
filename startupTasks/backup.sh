#!/bin/bash

# Setup variables
User=$(whoami)
input="/home/$User/"
output="/home/$User/"
fileName="Backup"-$(date +%b-%d-%Y)-$(date +%I:%M)
logFile=/home/$User/logs.txt
	
# This will be logged into logs.txt file in home dir.
echo "Backup script ran on:" $(date +%B-%d-%Y)-$(date +%I:%M) >> $logFile
# Looks for an old backup file. If not then creates without overwriting
oldFile="Backup-*"
if [ -d $oldFile ]
then
	echo "Old backup found..." >> $logFile
	echo "Overwriting old backup..." >> $logFile
	mv $output$oldFile $output$fileName
else
	echo "No old backup..." >> $logFile
	echo "Creating new backup..." >> $logFile
fi

# This line is to create the backup directory. Excludes useless directories
rsync -azh --stats $input $output$fileName --delete --exclude $oldFile --exclude $output$fileName  --exclude .cache --exclude Trash >> $logFile
echo "-------------------------------------------------" >> $logFile
# -Suspect
