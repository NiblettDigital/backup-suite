#!/bin/bash

# load environment file
source .env

# Print message
echo "Searching for the Newest MySQL Archive & Copying to the Weekly Folder"

# Get the File Name of the most recent MySQL Archive
WEEKLY=$(ls backups/mysql -t | egrep '\.sql.gz' | head -1)
cp $BACKUPS/$BACKUPS_MYSQL/$WEEKLY $BACKUPS/$BACKUPS_WEEKLY/$WEEKLY 

# Print message
echo "Search Complete"

# Print message
echo "Creating Archive from rsync folder"

# Create Archive
(cd $BACKUPS/$BACKUPS_DAILY && tar -czvf - * | gzip) > $BACKUPS/$BACKUPS_WEEKLY/$DATE_FORMAT"-weekly.tar.gz"

# Print message
echo "Archive Created"

# Print message
echo "Searching for old Archives"

# Find and Delete
find $BACKUPS/$BACKUPS_WEEKLY/* -mtime +$KEEP_WEEKLY_ARCHIVE -delete

# Print message
echo "Completing Archive Search"

# Exit Script
exit 0
