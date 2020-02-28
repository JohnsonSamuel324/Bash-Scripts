#!/bin/bash
## This script is used to run the startup scripts one at a time on bootup so they won't overlap in the logs.txt file

# Runs the update script
./update.sh
# Runs the backup script
./backup.sh

# -Suspect
