#!/bin/bash

# load environment file
source .env

# Print message
echo "Beginning rsync";

# rsync pull to this server 
rsync -arvz -e 'ssh -p '$REMOTE_PORT --delete $REMOTE_HOST:$REMOTE_ARCHIVE $BACKUPS/$BACKUPS_DAILY

# Print message
echo "Completing rsync";

# Exit Script
exit 0;
