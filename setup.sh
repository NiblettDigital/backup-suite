#!/bin/bash

# load environment file
source .env

# Create Default Directories
mkdir -p $BACKUPS
mkdir -p $BACKUPS/$BACKUPS_DAILY
mkdir -p $BACKUPS/$BACKUPS_WEEKLY
mkdir -p $BACKUPS/$BACKUPS_MONTHLY
mkdir -p $BACKUPS/$BACKUPS_MYSQL

# Print message
echo "Folders Created"
