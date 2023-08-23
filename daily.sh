#!/bin/bash

# load environment file
source .env

# Print message
echo "Creating Archive from rsync folder"

# Create Archive
(cd $BACKUPS/$BACKUPS_RSYNC && tar -czvf - * | gzip) > $BACKUPS/$BACKUPS_DAILY/$DATE_FORMAT"-media.tar.gz"

# Print message
echo "Archive Created"

# Print message
echo "Searching for old Archives"

# Find and Delete
find $BACKUPS/$BACKUPS_DAILY/* -mtime +$KEEP_DAILY_ARCHIVE -delete

# Print message
echo "Completing Archive Search"

# Exit Script
exit 0
