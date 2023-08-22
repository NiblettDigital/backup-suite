#!/bin/bash

# load environment file
source .env

# Print message
echo "Searching for the Newest MySQL Archive & Copying to the Monthly Folder"

# Get the File Name of the most recent MySQL Archive
MONTHLY_MYSQL=$(ls backups/mysql -t | egrep '\.sql.gz' | head -1)
cp $BACKUPS/$BACKUPS_MYSQL/$MONTHLY_MYSQL $BACKUPS/$BACKUPS_MONTHLY/$MONTHLY_MYSQL 

# Print message
echo "Search Complete"

# Print message
echo "Copying Monthly Archive from Daily folder"

# Copying Archive
MONTHLY_FILE=$(ls backups/daily -t | egrep '\.tar.gz' | head -1)
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
