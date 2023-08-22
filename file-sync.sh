#!/bin/bash

# load environment file
source .env

# Print message
echo "Beginning rsync";

# rsync archive folder(s) - pull to this server 
[ ! -z "$ARCHIVE_0" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_0/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_0;
[ ! -z "$ARCHIVE_1" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_1/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_1;
[ ! -z "$ARCHIVE_2" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_2/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_2;
[ ! -z "$ARCHIVE_3" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_3/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_3;
[ ! -z "$ARCHIVE_4" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_4/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_4;
[ ! -z "$ARCHIVE_5" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_5/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_5;
[ ! -z "$ARCHIVE_6" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_6/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_6;
[ ! -z "$ARCHIVE_7" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_7/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_7;
[ ! -z "$ARCHIVE_8" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_8/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_8;
[ ! -z "$ARCHIVE_9" ] && rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_PATH/$ARCHIVE_9/* $BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_9;

# Print message
echo "Completing rsync";

# Exit Script
exit 0;
