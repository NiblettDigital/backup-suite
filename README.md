# Niblett Digital - Backup Suite

This Suite of Backup Tools are designed to run externally. It can rsync up to 10 different media folders, and do a MySQL Dump of up to 3 different Databases.

It is configurable to archive the MySQL Dumps & rsync files Daily, and Duplicate Weekly and Monthly archives as well as remove out-of-date copies.

___

## TODO: 

Implement passing parameters to the script through crontab:
```
15 * * * * /mysql.sh [table_name1]
30 * * * * /mysql.sh [table_name2]
```

Then, in `mysql.sh`, we can capture the table name as follows:
```
$TABLE=$1 
```

This will allow me to remove `mysql_1.sh` and `mysql_2.sh`, and run everything through `mysql.sh` This format & setup was just a proof of concept to make sure the `daily.sh`, `weekly.sh` & `monthly.sh` scripts were able to generate proper archival files.

We can also pass multiple variables to `weekly.sh` and `monthly.sh`,
```
15 * * * * /weekly.sh [table_name1] [table_name2] [table_name2]
```

Then, in `weekly.sh` above the mysql search and copy, we can capture the table name as follows:
```
$DB_NAME_0=$1 
$DB_NAME_1=$2 
$DB_NAME_2=$3 
```
___

## File Notes & Descriptions

The `.sh` scripts below require the .env file exists, and is properly configured. Not all scripts have to be configured to run, however any archiving script require the `mysql_n.sh` **OR** `file-sync.sh` to be run.

### ``.env``

This file can be configured by duplicating the sample.env file. Some things to note:

1. `$REMOTE_PATH` should just be the absolute path to the application folder.
2. `$ARCHIVE_{n}` should be the relative path (from REMOTE PATH) to the folder that should be archived.
3. `$ARCHIVE_0` is a mandatory field
4. `$DB_NAME_0` is a mandatory field
5. `$DB_USER` **MUST** be the User on any of `$DB_NAME_{n}` required to backup.
6. `$DB_PASS` **MUST NOT** have a `$` in it.
7. `$DB_HOST` is relative from the web host. 

### ``setup.sh``

This script will ensure that all folders are created properly.

### ``file-sync.sh``

This script will create an rsync copy of upto 10 paths at once, and save them in `$BACKUPS/$BACKUPS_RSYNC/$ARCHIVE_{n}`

### ``mysql_{n}.sh``

If the script(s) are configured to run, they will create a gzipped mysql dump file and store them in `$BACKUPS/$BACKUPS_DAILY`. Archive copies will be duplicated by `weekly.sh` or `monthly.sh`

### ``daily.sh``

This script will create an archive of `$BACKUPS/$BACKUPS_RSYNC`, then move the archive to `$BACKUPS/$BACKUPS_DAILY`. Once done, it will remove any daily archive file(s) older than `$KEEP_DAILY_ARCHIVE` day(s) old.

### ``weekly.sh``

This script is designed to run once a week, and it will copy one archive file and `{n}` Mysql Dump Files to `$BACKUPS/$BACKUPS_WEEKLY`:
1. The latest MySQL Dump from `$BACKUPS/$BACKUPS_MYSQL`.
2. The latest Archive file from `$BACKUPS/$BACKUPS_DAILY`.

Once done, it will remove any weekly archive file(s) older than `$KEEP_WEEKLY_ARCHIVE` day(s) old.

### ``monthly.sh``

This script is designed to run once a month, and it will one archive file and `{n}` Mysql Dump Files to `$BACKUPS/$BACKUPS_MONTHLY`:
1. The latest MySQL Dump from `$BACKUPS/$BACKUPS_MYSQL`.
2. The latest Archive file from `$BACKUPS/$BACKUPS_DAILY`.

Once done, it will remove any monthly archive file(s) older than `$KEEP_MONTHLY_ARCHIVE` day(s) old.
<br><br>

## Expected Crontab Implementation

1. `setup.sh` **Manually** One Time at project start.
2. `mysql_{n}.sh` **Automatic** These can be run within 5 minutes (minimum) increments of each other, giving it time to complete the MySQL Dump. These can also be run as many times as necessary throughout the day.
3. `file-sync.sh` **Automatic** This can be run as often as required, the more it's run, the less resources it should require on each execution.
4. `daily.sh` **Automatic** This can be run once daily after `file-sync.sh` runs.
5. `weekly.sh` **Automatic** This can be run once weekly anytime after `daily.sh` runs.
5. `monthly.sh` **Automatic** This can be run once monthly anytime after `daily.sh` runs.
