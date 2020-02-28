#!/bin/bash

User=$(whoami)
downloadsDir=/home/$User/Downloads
picturesDir=/home/$User/Pictures
documentsDir=/home/$User/Documents
videosDir=/home/$User/Videos
musicDir=/home/$User/Music

# If directory is not empty then continue. If empty go to else statement
if [ ! -z "$(ls -A $downloadsDir)" ]
then
	# For every file in downloads directory repeat loop for each file
	for f in $downloadsDir/* 
	do
		# Variable holds the extension of the file
		ext="${f##*.}"
	
		# This block checks if extension is a picture type
		if [[ "$ext" =~ $(echo ^\($(paste -sd'|' picTypes.txt)\)$) ]]
		then
			echo "Moving `basename $f` to pictures directory..."
			mv "$f" "$picturesDir"
		fi
		
		# This block checks if extension is a document type
		if [[ "$ext" =~ $(echo ^\($(paste -sd'|' docTypes.txt)\)$) ]]
		then
			echo "Moving `basename $f` to Documents directory..."
			mv "$f" "$documentsDir"
		fi

		# This block checks if extension is a video type
		if [[ "$ext" =~ $(echo ^\($(paste -sd'|' videoTypes.txt)\)$) ]]
		then
			echo "Moving `basename $f` to Videos directory..."
                        mv "$f" "$videosDir"
		fi
		
		# This block checks if extension is an audio type
		if [[ "$ext" =~ $(echo ^\($(paste -sd'|' audioTypes.txt)\)$) ]]
                then
			echo "Moving `basename $f` to Music directory..."
                        mv "$f" "$musicDir"
                fi
	done
else
	echo "Downloads directory is clean!"
fi
