#!/bin/bash

# load environment file
source .env

# IF there isn't a third Database to archive
[ -z "$DB_NAME_2" ] && exit 0;

# Build File Name
FILE_NAME=$DB_NAME_2-$DATE_FORMAT".sql.gz"

# Print message
echo "Beginning MySQL Dump"

# SSH into the server, complete a mysql dump and download the file
ssh $REMOTE_HOST -p $REMOTE_PORT "mysqldump --no-tablespaces --databases $DB_NAME_2 --host=$DB_HOST --user=$DB_USER --password=$DB_PASSWORD | gzip -9"  > $BACKUPS/$BACKUPS_MYSQL/$FILE_NAME

# Print message
echo "Completing MySQL Dump"

# Print message
echo "Searching for old Archives"

# Find and Delete
find $BACKUPS/$BACKUPS_MYSQL/* -mtime +$KEEP_DAILY_ARCHIVE -delete

# Print message
echo "Completing Archive Search"

# Exit Script
exit 0
