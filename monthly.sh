#!/bin/bash

# load environment file
source .env

# Loop through all parameters passed to the script
for DATABASE in "$@"
do
  # Print message
  echo "Searching for the Newest MySQL Dump for $DATABASE & Copying to the Monthly Folder"
  
  # Build File Name
  MONTHLY_MYSQL=$(ls $BACKUPS/$BACKUPS_DAILY -t | egrep $DATABASE'\.sql.gz' | head -1)

  # IF there is a mysqldump to copy, proceed
  [ ! -z "$MONTHLY_MYSQL" ] && cp $BACKUPS/$BACKUPS_DAILY/$MONTHLY_MYSQL $BACKUPS/$BACKUPS_MONTHLY/$MONTHLY_MYSQL

  # Print message
  echo "Search Complete"

done

# Print message
echo "Copying Weekly Archive from Daily folder"

# Copying Archive
MONTHLY_FILE=$(ls $BACKUPS/$BACKUPS_DAILY -t | egrep '\.tar.gz' | head -1)
cp $BACKUPS/$BACKUPS_DAILY/$MONTHLY_FILE $BACKUPS/$BACKUPS_MONTHLY/$MONTHLY_FILE 

# Print message
echo "Archive Created"

# Print message
echo "Searching for old Archives"

# Find and Delete
find $BACKUPS/$BACKUPS_MONTHLY/* -mtime +$KEEP_MONTHLY_ARCHIVE -delete

# Print message
echo "Completing Archive Search"

# Exit Script
exit 0
