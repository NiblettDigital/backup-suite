#!/bin/bash

# load environment file
source .env

# Loop through all parameters passed to the script
for DATABASE in "$@"
do

  # Print message
  echo "Beginning MySQL Dump"
  
  # Build File Name
  FILE_NAME=$DATE_FORMAT-$DATABASE".sql.gz"

  # SSH into the server, complete a mysql dump and download the file
  ssh $REMOTE_HOST -p $REMOTE_PORT "mysqldump --no-tablespaces --databases $DATABASE --host=$DB_HOST --user=$DB_USER --password=$DB_PASSWORD | gzip -9"  > $BACKUPS/$BACKUPS_MYSQL/$FILE_NAME

  # Print message
  echo "Completing MySQL Dump"

done

# Print message
echo "Searching for old Archives"

# Find and Delete
find $BACKUPS/$BACKUPS_MYSQL/* -mtime +$KEEP_DAILY_ARCHIVE -delete

# Print message
echo "Completing Archive Search"

# Exit Script
exit 0
