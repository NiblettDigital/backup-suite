#!/bin/bash

# load environment file
source .env

# Create Default Directories
mkdir -p $BACKUPS
mkdir -p $BACKUPS/$BACKUPS_DAILY
mkdir -p $BACKUPS/$BACKUPS_WEEKLY
mkdir -p $BACKUPS/$BACKUPS_MONTHLY
mkdir -p $BACKUPS/$BACKUPS_MYSQL

# Create Archival Directories for passed parameters
# Loop through all parameters passed to the script
for ARCHIVE in "$@"
do
  # rsync archive folder(s) - pull to this server 
  mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE;

done

# Print message
echo "Folders Created"
