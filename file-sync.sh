#!/bin/bash

# load environment file
source .env

# Loop through all parameters passed to the script
for ARCHIVE in "$@"
do

  # Print message
  echo "Beginning rsync"

  # rsync archive folder(s) - pull to this server 
  rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE
  
  # Print message
  echo "Completing rsync";

done

# Exit Script
exit 0;
