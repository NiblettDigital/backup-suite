#!/bin/bash

# load environment file
source .env

# Print message
echo "Searching for the Newest MySQL Archive & Copying to the Weekly Folder"

# Get the File Name of the most recent MySQL Archive
WEEKLY_MYSQL=$(ls backups/mysql -t | egrep '\.sql.gz' | head -1)
cp $BACKUPS/$BACKUPS_MYSQL/$WEEKLY_MYSQL $BACKUPS/$BACKUPS_WEEKLY/$WEEKLY_MYSQL 

# Print message
echo "Search Complete"

# Print message
echo "Copying Weekly Archive from Daily folder"

# Copying Archive
WEEKLY_FILE=$(ls backups/daily -t | egrep '\.tar.gz' | head -1)
cp $BACKUPS/$BACKUPS_DAILY/$WEEKLY_FILE $BACKUPS/$BACKUPS_WEEKLY/$WEEKLY_FILE 

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
