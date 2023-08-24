# Niblett Digital - Backup Suite

This Suite of Backup Tools are designed to run externally. It can rsync up to 10 different media folders, and do a MySQL Dump of up to 3 different Databases.

It is configurable to archive the MySQL Dumps & rsync files Daily, and Duplicate Weekly and Monthly archives as well as remove out-of-date copies.

## File Notes & Descriptions

The `.sh` scripts below require the .env file exists, and is properly configured. Not all scripts have to be configured to run, however any archiving script require the `mysql_n.sh` **OR** `file-sync.sh` to be run.

### ``.env``

This file can be configured by duplicating the sample.env file. Some things to note:

1. `$REMOTE_PATH` should just be the absolute path to the application folder.
2. `$DB_USER` **MUST** be the User the database name being passed as a parameter on `mysql.sh`
3. `$DB_PASS` **MUST NOT** have a `$` in it.
4. `$DB_HOST` is relative from the web host. 

### ``setup.sh``

This script will ensure that all folders are created properly.

```
Execution
./setup.sh [options]

Example [Options are x number of Media Archive Folders]
./setup.sh wp-content/uploads
```

### ``file-sync.sh``

This script will create an rsync copy of as many paths that are passed to the script, and pull them into `$BACKUPS/$BACKUPS_RSYNC/$ARCHIVE`

```
Execution
./file-sync.sh [options]

Example [Options are x number of Media Archive Folders]
./file-sync.sh wp-content/uploads
```

### ``mysql.sh``

If the script(s) are configured to run, they will create a gzipped mysql dump file and store them in `$BACKUPS/$BACKUPS_DAILY`. Archive copies will be duplicated by `weekly.sh` or `monthly.sh`

You must pass at least one parameter to the script, the database name. There can be multiple, but one minimum.

```
Execution
./mysql.sh [options]

Example [Options are x number of Databases with user $DB_USER access]
./mysql.sh database1 database2
```

### ``daily.sh``

This script will create an archive of `$BACKUPS/$BACKUPS_RSYNC`, then move the archive to `$BACKUPS/$BACKUPS_DAILY`. Once done, it will remove any daily archive file(s) older than `$KEEP_DAILY_ARCHIVE` day(s) old.

```
Execution
./daily.sh

Example 
./daily.sh 
```

### ``weekly.sh``

This script is designed to run once a week, and it will copy a media archive file (if available) and Mysql Dump File(s) to `$BACKUPS/$BACKUPS_WEEKLY`:
1. The latest MySQL Dump from `$BACKUPS/$BACKUPS_DAILY`.
2. The latest Archive file from `$BACKUPS/$BACKUPS_DAILY`.

Once done, it will remove any weekly archive file(s) older than `$KEEP_WEEKLY_ARCHIVE` day(s) old.

```
Execution
./weekly.sh [options]

Example [Options are x number of Databases with user $DB_USER access]
./weekly.sh database1 database2
```

### ``monthly.sh``

This script is designed to run once a month, and it will one archive file and `{n}` Mysql Dump Files to `$BACKUPS/$BACKUPS_MONTHLY`:
1. The latest MySQL Dump from `$BACKUPS/$BACKUPS_DAILY`.
2. The latest Archive file from `$BACKUPS/$BACKUPS_DAILY`.

Once done, it will remove any monthly archive file(s) older than `$KEEP_MONTHLY_ARCHIVE` day(s) old.
```
Execution
./monthly.sh [options]

Example [Options are x number of Databases with user $DB_USER access]
./monthly.sh database1 database2
```
<br><br>

## Expected Crontab Implementation

1. `setup.sh` **Manually** One Time at project start.
2. `mysql.sh` **Automatic** This file can be run one at a time and spaced apart, or it can be run once with multiple mysql dumps at once. Keep in mind if the database is larger, it would be better to split the executions up and run one database per execution.
3. `file-sync.sh` **Automatic** This can be run as often as required, the more it's run, the less resources it should require on each execution.
4. `daily.sh` **Automatic** This can be run once daily after `file-sync.sh` runs.
5. `weekly.sh` **Automatic** This can be run once weekly anytime after `daily.sh` runs.
5. `monthly.sh` **Automatic** This can be run once monthly anytime after `daily.sh` runs.
