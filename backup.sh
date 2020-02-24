#!/bin/bash

User=$(whoami)
input="/home/$User/"
output="/home/$User/Backups/"
fileName="Backup"-$(date +%b-%d-%Y)-$(date +%I:%M)

if [ ! -d "$output" ]
then
	echo "Making backups directory..."
	mkdir "$output"
fi

oldFile="Backup-*"
cd "$output"
if [ -d "$oldFile" ] && [ ! -d "$output$fileName" ]
then
	echo "Old backup found..."
	echo "Overwriting old backup..."
	mv $oldFile $output$fileName
else
	echo "No old backup..."
	echo "Creating new backup..."
fi
cd ..

rsync -azh --stats $input $output$fileName --delete --exclude Backups -- .cache --exclude Trash
