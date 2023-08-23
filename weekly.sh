#!/bin/bash

# load environment file
source .env

# Print message
echo "Searching for the Newest MySQL Archive(s) & Copying to the Weekly Folder"

# Get the File Name of the most recent MySQL Archive for $DB_NAME_0
if [ ! -z "$DB_NAME_0" ] 
then 
  WEEKLY_MYSQL_0=$(ls $BACKUPS/$BACKUPS_MYSQL -t | egrep $DB_NAME_0'\.sql.gz' | head -1)
  [ ! -z "$WEEKLY_MYSQL_0" ] && cp $BACKUPS/$BACKUPS_MYSQL/$WEEKLY_MYSQL_0 $BACKUPS/$BACKUPS_WEEKLY/$WEEKLY_MYSQL_0
fi

if [ ! -z "$DB_NAME_1" ] 
then 
  WEEKLY_MYSQL_1=$(ls $BACKUPS/$BACKUPS_MYSQL -t | egrep $DB_NAME_1'\.sql.gz' | head -1)
  [ ! -z "$WEEKLY_MYSQL_1" ] && cp $BACKUPS/$BACKUPS_MYSQL/$WEEKLY_MYSQL_1 $BACKUPS/$BACKUPS_WEEKLY/$WEEKLY_MYSQL_1
fi

if [ ! -z "$DB_NAME_2" ] 
then 
  WEEKLY_MYSQL_2=$(ls $BACKUPS/$BACKUPS_MYSQL -t | egrep $DB_NAME_2'\.sql.gz' | head -1)
  [ ! -z "$WEEKLY_MYSQL_2" ] && cp $BACKUPS/$BACKUPS_MYSQL/$WEEKLY_MYSQL_2 $BACKUPS/$BACKUPS_WEEKLY/$WEEKLY_MYSQL_2
fi

# Print message
echo "Search Complete"

# Print message
echo "Copying Weekly Archive from Daily folder"

# Copying Archive
WEEKLY_FILE=$(ls $BACKUPS/$BACKUPS_DAILY -t | egrep '\.tar.gz' | head -1)
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
