#!/bin/bash

# load environment file
source .env

# Create Default Directories
mkdir -p $BACKUPS
mkdir -p $BACKUPS/$BACKUPS_DAILY
mkdir -p $BACKUPS/$BACKUPS_WEEKLY
mkdir -p $BACKUPS/$BACKUPS_MONTHLY
mkdir -p $BACKUPS/$BACKUPS_MYSQL
[ ! -z "$ARCHIVE_0" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_0;
[ ! -z "$ARCHIVE_1" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_1;
[ ! -z "$ARCHIVE_2" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_2;
[ ! -z "$ARCHIVE_3" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_3;
[ ! -z "$ARCHIVE_4" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_4;
[ ! -z "$ARCHIVE_5" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_5;
[ ! -z "$ARCHIVE_6" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_6;
[ ! -z "$ARCHIVE_7" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_7;
[ ! -z "$ARCHIVE_8" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_8;
[ ! -z "$ARCHIVE_9" ] && mkdir -p $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_9;

# Print message
echo "Folders Created"
